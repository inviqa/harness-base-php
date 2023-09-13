{{- define "application.volumeMounts.backend" }}
- mountPath: {{ index .Values.persistence "spryker-data" "mountPath" | quote }}
  name: spryker-data-volume
{{- end }}

{{- define "application.volumes.backend" }}
- name: spryker-data-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl (index .Values.persistence "spryker-data" "claimName") $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "spryker-data" "mountPath" | quote }}
{{- end }}
