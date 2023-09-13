{{- define "application.volumeMounts.backend" }}
- mountPath: {{ index .Values.persistence "akeneo-file-storage" "mountPath" | quote }}
  name: akeneo-file-storage-volume
- mountPath: {{ index .Values.persistence "akeneo-uploads" "mountPath" | quote }}
  name: akeneo-uploads-volume
{{- end }}

{{- define "application.volumes.backend" }}
- name: akeneo-file-storage-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl (index .Values.persistence "akeneo-file-storage" "claimName") $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
- name: akeneo-uploads-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl (index .Values.persistence "akeneo-uploads" "claimName") $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "akeneo-file-storage" "mountPath" | quote }}
- {{ index .Values.persistence "akeneo-uploads" "mountPath" | quote }}
{{- end }}
