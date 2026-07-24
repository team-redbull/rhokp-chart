{{- define "rhokp.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "rhokp.fullname" -}}
{{- .Release.Name -}}
{{- end -}}

{{- define "rhokp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rhokp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "rhokp.image" -}}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.repository .Values.image.tag -}}
{{- end -}}

{{- define "rhokp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- .Values.serviceAccount.name | default (include "rhokp.fullname" .) -}}
{{- else -}}
{{- .Values.serviceAccount.name | default "default" -}}
{{- end -}}
{{- end -}}

