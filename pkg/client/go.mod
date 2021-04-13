module github.com/ZipRecruiter/prometheus-operator/pkg/client

go 1.14

require (
	github.com/ZipRecruiter/prometheus-operator/pkg/apis/monitoring v0.46.0
	k8s.io/apimachinery v0.19.2
	k8s.io/client-go v0.19.2
)

replace github.com/ZipRecruiter/prometheus-operator/pkg/apis/monitoring => ../apis/monitoring
