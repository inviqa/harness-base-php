{{- define "application.volumeMounts.backend" }}
- mountPath: {{ .Values.persistence.akeneo.file_storage.mountPath | quote }}
  name: akeneo-file-storage-volume
- mountPath: {{ .Values.persistence.akeneo.uploads.mountPath | quote }}
  name: akeneo-uploads-volume
{{- end }}

{{- define "application.volumes.backend" }}
- name: akeneo-file-storage-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl .Values.persistence.akeneo.file_storage.claimName $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
- name: akeneo-uploads-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl .Values.persistence.akeneo.uploads.claimName $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ .Values.persistence.akeneo.file_storage.mountPath | quote }}
- {{ .Values.persistence.akeneo.uploads.mountPath | quote }}
{{- end }}
