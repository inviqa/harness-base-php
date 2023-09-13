{{- define "application.volumeMounts.all" }}
- mountPath: {{ index .Values.persistence "magento-media" "mountPath" | quote }}
  name: magento-media-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: magento-media-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl (index .Values.persistence "magento-media" "claimName") $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "magento-media" "mountPath" | quote }}
{{- end }}
