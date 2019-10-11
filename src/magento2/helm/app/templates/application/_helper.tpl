{{- define "application.volumeMounts.all" }}
- mountPath: {{ .Values.persistence.magento.media.mountPath | quote }}
  name: magento-media-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: magento-media-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: magento-media-pvc
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}
