{{- define "application.volumeMounts.all" }}
- mountPath: {{ index .Values.persistence "magento-media" "mountPath" | quote }}
  name: magento-media-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: magento-media-volume
{{- if and .Values.persistence.enabled (index .Values.persistence "magento-media" "enabled") }}
  persistentVolumeClaim:
    claimName: {{ include "persistence.claimName" (dict "root" $ "name" "magento-media") | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "magento-media" "mountPath" | quote }}
{{- end }}
