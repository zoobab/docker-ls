[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
About registry-ls
=================

The author of Docker-ls refused patches with those shell scripts on top of
docker-ls, so here they are.

They are very useful if you want to do shell scripting on top of them.

Note: this script will only work with this patched version of docker-ls, as
of today, the mayflower's one does not support the env var
DOCKER_REGISTRY_URL, see https://github.com/mayflower/docker-ls/pull/8

Prebuilt Docker Image
=====================

If you want to use a prebuilt docker image hosted on the Docker Hub:

```
$ docker run -it -e DOCKER_REGISTRY_URL=https://myregistry.zoobab.com zoobab/docker-ls registry-ls
busybox:latest
busybox:one
busybox:two
```

You can also pass login and password:

```
$ docker run -it -e DOCKER_REGISTRY_URL=https://myregistry2.zoobab.com -e DOCKER_REGISTRY_LOGIN=mylogin -e DOCKER_REGISTRY_PWD=mypwd zoobab/docker-ls registry-ls
busybox:latest
busybox:one
busybox:two
```

Delete a tag (beware that this only deletes the tag, you have to run a garbage collector registry side to free the disk space):

```
$ docker run -it -e DOCKER_REGISTRY_URL=https://myregistry2.zoobab.com zoobab/docker-ls registry-rmtag busybox:latest
Deleting tag busybox:latest ...Tag deleted successfully!
```

Get the sha256 hash of the image:

```
$ docker run -it -e DOCKER_REGISTRY_URL=https://myregistry2.zoobab.com zoobab/docker-ls registry-lslayers busybox:latest
sha256:8489df91d70f35bddb5648f5931807146285a513a034a627fa1efbf4ba4357e7
```

Dependencies
============

* docker-ls
* docker-rm
* jq ( >= 1.4 )
* grep
* echo

Usage
=====

In order to use those scripts, you need to set first the address of the
registry as an environement variable:

```
$ export DOCKER_REGISTRY_URL="https://mydocker.registry.com"
```

If you need a login+password to access your registry, you can also set them:

```
$ export DOCKER_REGISTRY_LOGIN="mylogin"
$ export DOCKER_REGISTRY_PWD="mypassword"
```
Install
=======

To install those scripts, just do a `make install`:

```
$ cd scripts/
$ make install
sudo cp -v registry-ls registry-rmtag registry-lslayers ../bin/docker-ls ../bin/docker-rm /usr/local/bin/
'registry-ls' -> '/usr/local/bin/registry-ls'
'registry-rmtag' -> '/usr/local/bin/registry-rmtag'
'registry-lslayers' -> '/usr/local/bin/registry-lslayers'
'../bin/docker-ls' -> '/usr/local/bin/docker-ls'
'../bin/docker-rm' -> '/usr/local/bin/docker-rm'
sudo chmod 755 /usr/local/bin/{registry-ls,registry-rmtag,registry-lslayers,docker-ls,docker-rm}
```

Screenshots
===========

List contents of a registry with output one repo:tag per line:

```
$ registry-ls
busybox:one
busybox:two
busybox:three
busybox:four
```

Remove a tag:

```
$ registry-rmtag busybox:latest
Deleting tag busybox:latest ...Tag deleted successfully!
```

Combine both to delete all tags:

```
$ for i in `registry-ls`; do registry-rmtag $i; done
Deleting tag busybox:one ...Tag deleted successfully!
Deleting tag busybox:two ...Tag deleted successfully!
Deleting tag busybox:three ...Tag deleted successfully!
Deleting tag busybox:four ...Tag deleted successfully!
```

Check that the registry is empty:

```
$ registry-ls
$ 
```

Get the sha256 hash of the image (useful to see if for ex "myimage:latest" has changed):

```
$ registry-lslayers busybox:latest
sha256:8489df91d70f35bddb5648f5931807146285a513a034a627fa1efbf4ba4357e7
```
