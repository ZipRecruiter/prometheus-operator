# prometheus-operator
A copy of https://github.com/coreos/prometheus-operator without the cruft that we don't need, and with modules dependencies that match those of our monorepo.

# Steps to create this

...and thus the steps to update.

```
$ export TMPROOT="$(pwd)/temp"
$ mkdir $TMPROOT && cd $TMPROOT
$ export COREOSPO=$TMPROOT/original/promtheus-operator
$ export COREOSVERSION="v.0.38.1" # NOTE: When updating, change this version
$ export ZRPO=$TMPROOT/ZipRecruiter/promtheus-operator
$ git clone https://github.com/coreos/prometheus-operator.git $COREOSPO
$ git clone https://github.com/ZipRecruiter/prometheus-operator.git $ZRPO
$ cd $COREOS && git checkout $COREOSVERSION
$ cp -r $COREOSPO/pkg $ZRPO/
$ cp $COREOSPO/go.mod $ZRPO/
$ cd $ZRPO/
$ go mod tidy  # NOTE: This command might fail, that's probably fine
# manually remove all `replace` statements from go.mod
$ go mod edit --require k8s.io/client-go@v0.16.7
# Cross your fingers
```

To test the update, in the ZR monorepo:

```
$ go mod edit --replace github.com/ZipRecruiter/prometheus-operator=$ZRPO
$ gozr update-modules
$ gozr gta
```

If all of the above succeeds...

```
$ cd $ZRPO
$ git add .
$ git commit -m "<Helpful commit message>"
$ git push
$ git tag $COREOSVERSION
$ git push $COREOSVERSION
```

...and that should do it.
