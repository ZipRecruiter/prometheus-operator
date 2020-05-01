module github.com/ZipRecruiter/prometheus-operator

go 1.13

require (
	github.com/blang/semver v3.5.1+incompatible
	github.com/ghodss/yaml v1.0.0
	github.com/go-kit/kit v0.10.0
	github.com/go-openapi/swag v0.19.5
	github.com/hashicorp/go-version v1.2.0
	github.com/kylelemons/godebug v1.1.0
	github.com/mitchellh/hashstructure v1.0.0
	github.com/openshift/prom-label-proxy v0.1.0
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
