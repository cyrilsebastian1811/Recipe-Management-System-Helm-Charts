{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}

{{- define "configMapName" }}
{{- printf "%s-%s" "envconfig" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "dbsecretName" }}
{{- printf "%s-%s" "dbsecret" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "dockerregistrykeyName" }}
{{- printf "%s-%s" "dockerregistrykey" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "backendreplicasetName" }}
{{- printf "%s-%s" "backendreplicaset" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "labelName" }}
{{- printf "%s-%s" "backend" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "serviceName" }}
{{- printf "%s-%s" "backendlb" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}