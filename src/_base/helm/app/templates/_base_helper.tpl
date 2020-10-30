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
{{ if .Values.feature.sealed_secrets }}
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
{{ else }}
apiVersion: v1
kind: Secret
{{ end }}
metadata:
  name: {{ .Values.resourcePrefix }}{{ .service_name }}
  annotations:
    argocd.argoproj.io/sync-wave: "1"
{{ if .Values.feature.sealed_secrets }}
{{ if ne .Values.sealed_secrets.scope "strict" }}
    sealedsecrets.bitnami.com/{{ .Values.sealed_secrets.scope }}: "true"
{{ end }}
spec:
  encryptedData:
{{ index .service.environment_secrets | toYaml | nindent 4 -}}
{{ else }}
stringData:
{{ index .service.environment_secrets | toYaml | nindent 2 -}}
{{ end }}
{{ end }}
{{- end }}
