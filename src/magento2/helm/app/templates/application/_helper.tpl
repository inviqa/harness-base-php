{{- define "application.volumeMounts.all" }}
- mountPath: {{ index .Values.persistence "magento-media" "mountPath" | quote }}
  name: magento-media-volume
{{- end }}

{{- define "application.volumeMounts.backend" }}
- mountPath: {{ index .Values.persistence "magento-export" "mountPath" | quote }}
  name: magento-export-volume
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

{{- define "application.volumes.backend" }}
- name: magento-export-volume
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ tpl (index .Values.persistence "magento-export" "claimName") $ | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "magento-export" "mountPath" | quote }}
- {{ index .Values.persistence "magento-media" "mountPath" | quote }}
{{- end }}
