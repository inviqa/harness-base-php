{{- define "application.volumeMounts.all" }}
- mountPath: {{ .Values.persistence.drupal.files.mountPath | quote }}
  name: drupal-files-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: drupal-files-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: drupal-files-pvc
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}
