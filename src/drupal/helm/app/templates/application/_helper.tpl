{{- define "application.volumeMounts.all" }}
- mountPath: {{ .Values.persistence.drupal.files.mountPath | quote }}
  name: drupal-files-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: drupal-files-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl .Values.persistence.drupal.files.claimName $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ .Values.persistence.drupal.files.mountPath | quote }}
{{- end }}
