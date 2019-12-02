{{- define "application.volumeMounts.backend" }}
- mountPath: {{ .Values.persistence.spryker.data.mountPath | quote }}
  name: spryker-data-volume
{{- end }}

{{- define "application.volumes.backend" }}
- name: spryker-data-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl .Values.persistence.spryker.data.claimName $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ .Values.persistence.spryker.data.mountPath | quote }}
{{- end }}
