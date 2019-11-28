{{- define "application.volumeMounts.all" }}
- mountPath: {{ .Values.persistence.magento.media.mountPath | quote }}
  name: magento-media-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: magento-media-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl .Values.persistence.magento.media.claimName $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ .Values.persistence.magento.media.mountPath | quote }}
{{- end }}
