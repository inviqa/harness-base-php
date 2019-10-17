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
