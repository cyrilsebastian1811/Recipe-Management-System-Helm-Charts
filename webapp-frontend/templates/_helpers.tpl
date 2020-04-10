{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}

{{- define "deploymentName" }}
{{- printf "%s-%s" "deployment" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "labelName" }}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
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
{{- printf "%s-%s" "lb" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "serviceAccountName" }}
{{- printf "%s-%s" "sa" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "roleName" }}
{{- printf "%s-%s" "role" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "roleBindingName" }}
{{- printf "%s-%s" "rolebinding" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "webappDomainName" }}
{{- printf "%s.%s" "ui" .Values.domainName -}}
{{- end }}

{{- define "path" }}
{{- printf "/%s" .Release.Namespace | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "ingressName" }}
{{- printf "%s-%s" "ingress" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}