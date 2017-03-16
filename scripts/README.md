About registry-ls
=================

The author of Docker-ls refused patches with those shell scripts on top of
docker-ls, so here they are.

They are very useful if you want to do shell scripting on top of them.

Note: this script will only work with this patched version of docker-ls, as
of today, the mayflower's one does not support the env var
DOCKER_REGISTRY_URL, see https://github.com/mayflower/docker-ls/pull/8

Dependencies
============

* docker-ls
* docker-rm
* jq
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
