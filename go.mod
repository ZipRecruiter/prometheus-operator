module github.com/ZipRecruiter/prometheus-operator

go 1.15

require (
	github.com/blang/semver/v4 v4.0.0
	github.com/brancz/kube-rbac-proxy v0.8.0
	github.com/docker/distribution v2.7.1+incompatible
	github.com/evanphx/json-patch/v5 v5.1.0
	github.com/ghodss/yaml v1.0.0
	github.com/go-kit/kit v0.10.0
	github.com/go-openapi/swag v0.19.12
	github.com/gogo/protobuf v1.3.2
	github.com/golang/protobuf v1.4.3
	github.com/google/go-cmp v0.5.4
	github.com/hashicorp/go-version v1.2.1
	github.com/kylelemons/godebug v1.1.0
	github.com/mitchellh/hashstructure v1.0.1-0.20200508175121-8fdbea448aa6
	github.com/oklog/run v1.1.0
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.6.0
	github.com/prometheus/prometheus v2.5.0+incompatible
	github.com/prometheus/tsdb v0.10.0 // indirect
	github.com/stretchr/testify v1.4.0
	gopkg.in/yaml.v2 v2.2.8
	k8s.io/api v0.18.2
	k8s.io/apiextensions-apiserver v0.18.2
	k8s.io/apimachinery v0.18.2
	k8s.io/client-go v0.16.7
)

replace (
	github.com/ZipRecruiter/prometheus-operator/pkg/apis/monitoring => ./pkg/apis/monitoring
	github.com/ZipRecruiter/prometheus-operator/pkg/client => ./pkg/client
)
