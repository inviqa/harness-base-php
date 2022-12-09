{{/*
Common labels
*/}}
{{- define "chart.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Values.appVersion | default .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Common selectors
*/}}
{{- define "chart.selectors" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "application.volumes.backend" }}{{ end }}
{{- define "application.volumeMounts.backend" }}{{ end }}

{{- define "application.volumes.all" }}{{ end }}
{{- define "application.volumeMounts.all" }}{{ end }}

{{- define "application.volumes.wwwDataPaths" }}{{ end }}

{{- define "application.volumes.console" -}}
{{- if .Values.persistence.mountVolumesOnConsole -}}
{{- template "application.volumes.backend" . -}}
{{- template "application.volumes.all" . -}}
{{- end -}}
{{- end }}
{{- define "application.volumeMounts.console" -}}
{{- if .Values.persistence.mountVolumesOnConsole -}}
{{- template "application.volumeMounts.backend" . -}}
{{- template "application.volumeMounts.all" . -}}
{{- end -}}
{{- end }}

{{- define "service.environment.secret" }}
{{ if and .service.environment_secrets (.service.enabled | default true) }}
{{ if .root.Values.feature.sealed_secrets }}
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
{{ else }}
apiVersion: v1
kind: Secret
{{ end }}
metadata:
  name: {{ .root.Values.resourcePrefix }}{{ .service_name }}
  labels:
    {{- include "chart.labels" .root | nindent 4 }}
    app.kubernetes.io/component: {{ .component | default .service_name }}
  annotations:
    argocd.argoproj.io/sync-wave: "1"
{{ if .root.Values.feature.sealed_secrets }}
{{ if ne .root.Values.sealed_secrets.scope "strict" }}
    sealedsecrets.bitnami.com/{{ .root.Values.sealed_secrets.scope }}: "true"
{{ end }}
spec:
  encryptedData:
{{ index .service.environment_secrets | toYaml | nindent 4 }}
  template:
    metadata:
      labels:
        {{- include "chart.labels" .root | nindent 8 }}
        app.kubernetes.io/component: {{ .component | default .service_name }}
{{ else }}
stringData:
{{ index .service.environment_secrets | toYaml | nindent 2 -}}
{{ end }}
{{ end }}
{{- end }}

{{/*
A template to fully resolve services that extend template services
*/}}
{{- define "service.resolved" -}}
{{- $service := index $.root.Values.services $.service_name -}}
{{- $extended := (dict) -}}
{{- range $service.extends -}}
{{ $_ := mergeOverwrite $extended (include "service.resolved" (dict "root" $.root "service_name" .) | fromYaml) }}
{{- end -}}
{{- $_ := mergeOverwrite $extended $service -}}
{{ $extended | toYaml }}
{{- end -}}

{{- define "pod.selfAntiAffinity" -}}
{{- $topologyKey := (.service.affinity | default (dict)).selfAntiAffinityTopologyKey | default .root.Values.global.affinity.selfAntiAffinityTopologyKey }}
{{- if $topologyKey }}
preferredDuringSchedulingIgnoredDuringExecution:
  - weight: 100
    podAffinityTerm:
      labelSelector:
        matchLabels:
          app.service: {{ .root.Values.resourcePrefix }}{{ .serviceName }}
      topologyKey: {{ $topologyKey }}
{{- end }}
{{- end -}}

{{- define "pod.affinity" -}}
{{- $selfAntiAffinity := (include "pod.selfAntiAffinity" .) | fromYaml | default (dict) -}}
{{- $affinity := omit (deepCopy (.service.affinity | default (dict) )) "selfAntiAffinityTopologyKey" -}}
{{- if $selfAntiAffinity -}}
  {{- $_ := set $affinity "podAntiAffinity" (index $affinity "podAntiAffinity" | default (dict)) -}}
  {{- range $key, $value := pick $selfAntiAffinity "preferredDuringSchedulingIgnoredDuringExecution" "requiredDuringSchedulingIgnoredDuringExecution" -}}
    {{- $_ := set $affinity.podAntiAffinity $key (concat (index $affinity.podAntiAffinity $key | default (list)) ($value)) -}}
  {{- end -}}
{{- end -}}
{{ $affinity | toYaml }}
{{- end -}}

{{- define "pod.topologySpreadConstraints" }}
{{- $topologySpreadConstraints := $.service.topologySpreadConstraints | default $.root.Values.global.topologySpreadConstraints }}
{{- if eq (len $topologySpreadConstraints) 0 -}}
[]
{{- else }}
{{- range $topologySpreadConstraints }}
- 
  {{- with (pick . "maxSkew" "topologyKey" "whenUnsatisfiable") }}
  {{- . | toYaml | nindent 2 }}
  {{- end }}
  {{- if not (hasKey . "maxSkew") }}
  maxSkew: 1
  {{- end }}
  {{- if not (hasKey . "whenUnsatisfiable") }}
  whenUnsatisfiable: ScheduleAnyway
  {{- end }}
  {{- if not (or (hasKey . "labelSelector") (hasKey . "matchLabelKeys")) }}
  labelSelector:
    matchLabels:
      app.service: {{ $.root.Values.resourcePrefix }}{{ $.serviceName }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
