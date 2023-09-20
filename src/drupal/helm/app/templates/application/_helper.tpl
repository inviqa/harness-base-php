{{- define "application.volumeMounts.all" }}
- mountPath: {{ index .Values.persistence "drupal-files" "mountPath" | quote }}
  name: drupal-files-volume
{{- end }}

{{- define "application.volumes.all" }}
- name: drupal-files-volume
{{- if and $.Values.persistence.enabled (index .Values.persistence "drupal-files" "enabled") }}
  persistentVolumeClaim:
    claimName: {{ include "persistence.claimName" (dict "root" $ "name" "drupal-files") | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "drupal-files" "mountPath" | quote }}
{{- end }}
