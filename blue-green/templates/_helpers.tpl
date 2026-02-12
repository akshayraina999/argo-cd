{{- define "helm-guestbook.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "helm-guestbook.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "helm-guestbook.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
