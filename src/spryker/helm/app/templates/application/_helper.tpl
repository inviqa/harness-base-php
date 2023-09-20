{{- define "application.volumeMounts.backend" }}
- mountPath: {{ index .Values.persistence "spryker-data" "mountPath" | quote }}
  name: spryker-data-volume
{{- end }}

{{- define "application.volumes.backend" }}
- name: spryker-data-volume
{{- if and $.Values.persistence.enabled (index .Values.persistence "spryker-data" "enabled") }}
  persistentVolumeClaim:
    claimName: {{ include "persistence.claimName" (dict "root" $ "name" "spryker-data") | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "spryker-data" "mountPath" | quote }}
{{- end }}
