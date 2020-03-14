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

{{- define "deploymentName" }}
{{- printf "%s-%s" "deployment" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "labelName" }}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "serviceName" }}
{{- printf "%s-%s" "lb" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "awssecretName" }}
{{- printf "%s-%s" "awssecret" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "redisSecretName" }}
{{- printf "%s-%s" "redissecret" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "initContainerName" }}
{{- printf "%s-%s" "initcontainer" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "redisHost" }}
{{- printf "%s-redis.%s.svc.cluster.local" .Release.Name .Release.Namespace }}
{{- end }}