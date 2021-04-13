# prometheus-operator
A copy of https://github.com/prometheus-operator/prometheus-operator without the cruft that we don't need, and with modules dependencies that match those of our monorepo.

# Steps to create this

...and thus the steps to update.

```
$ export TMPROOT="$(pwd)/temp"
$ mkdir $TMPROOT && cd $TMPROOT
$ export COREOSPO=$TMPROOT/original/promtheus-operator
$ export COREOSVERSION="v0.38.1" # NOTE: When updating, change this version
$ export ZRPO=$TMPROOT/ZipRecruiter/promtheus-operator
$ git clone https://github.com/prometheus-operator/prometheus-operator.git $COREOSPO
$ git clone https://github.com/ZipRecruiter/prometheus-operator.git $ZRPO
$ cd $COREOS && git checkout $COREOSVERSION
$ cp -r $COREOSPO/pkg $ZRPO/
$ cp $COREOSPO/go.mod $ZRPO/
$ cd $ZRPO/
# on macOS built in sed will not work this way, install and use gsed from brew
$ find . -name '*.go' | xargs sed -i 's/github\.com\/prometheus-operator\/prometheus-operator/github.com\/ZipRecruiter\/prometheus-operator/g'
$ go mod tidy  # NOTE: This command might fail, that's probably fine
# manually remove all `replace` statements from go.mod
$ go mod edit --require k8s.io/client-go@v0.16.7
# Cross your fingers
```

To test the update, in the ZR monorepo:

```
$ go mod edit --replace github.com/ZipRecruiter/prometheus-operator=$ZRPO
$ go mod edit --replace github.com/ZipRecruiter/prometheus-operator/pkg/client=$ZRPO/pkg/client
$ go mod edit --replace github.com/ZipRecruiter/prometheus-operator/pkg/apis/monitoring=$ZRPO/pkg/apis/monitoring
$ gozr update-modules
$ gozr gta
```

If all of the above succeeds, remove the added `replace` in the step above, then:

```
$ cd $ZRPO
$ git add .
$ git commit -m "<Helpful commit message>"
$ git push
$ git tag $COREOSVERSION
$ git push $COREOSVERSION
```

...and that should do it.
