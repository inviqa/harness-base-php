{{- define "application.volumeMounts.all" }}
- mountPath: {{ .Values.persistence.magento.media.mountPath | quote }}
  name: magento-media-volume
{{- end }}

{{- define "application.volumeMounts.backend" }}
- mountPath: {{ .Values.persistence.magento.export.mountPath | quote }}
  name: magento-export-volume
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

{{- define "application.volumes.backend" }}
- name: magento-export-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl .Values.persistence.magento.export.claimName $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ .Values.persistence.magento.export.mountPath | quote }}
- {{ .Values.persistence.magento.media.mountPath | quote }}
{{- end }}
