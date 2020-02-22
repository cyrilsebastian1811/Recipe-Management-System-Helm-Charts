{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}

{{- define "frontendreplicasetName" }}
{{- printf "%s-%s" "frontendreplicaset" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "labelName" }}
{{- printf "%s-%s" "frontend" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "initContainerName" }}
{{- printf "%s-%s" "frontendinitcontainer" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "initCommand" }}
{{- printf "until nslookup %s.svc.cluster.local; do echo waiting for backend service; sleep 2; done;" .Values.internalBackendService }}
{{- end }}

{{- define "dockerregistrykeyName" }}
{{- printf "%s-%s" "dockerregistrykey" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "serviceName" }}
{{- printf "%s-%s" "frontendlb" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}