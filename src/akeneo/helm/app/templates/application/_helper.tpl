{{- define "application.volumeMounts.backend" }}
- mountPath: {{ index .Values.persistence "akeneo-file-storage" "mountPath" | quote }}
  name: akeneo-file-storage-volume
- mountPath: {{ index .Values.persistence "akeneo-uploads" "mountPath" | quote }}
  name: akeneo-uploads-volume
{{- end }}

{{- define "application.volumes.backend" }}
- name: akeneo-file-storage-volume
{{- if and $.Values.persistence.enabled (index .Values.persistence "akeneo-file-storage" "enabled") }}
  persistentVolumeClaim:
    claimName: {{ include "persistence.claimName" (dict "root" $ "name" "akeneo-file-storage") | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
- name: akeneo-uploads-volume
{{- if and $.Values.persistence.enabled (index .Values.persistence "akeneo-uploads" "enabled") }}
  persistentVolumeClaim:
    claimName: {{ include "persistence.claimName" (dict "root" $ "name" "akeneo-uploads") | quote }}
{{- else }}
  emptyDir: {}
{{- end }}
{{- end }}

{{- define "application.volumes.wwwDataPaths" }}
- {{ index .Values.persistence "akeneo-file-storage" "mountPath" | quote }}
- {{ index .Values.persistence "akeneo-uploads" "mountPath" | quote }}
{{- end }}
