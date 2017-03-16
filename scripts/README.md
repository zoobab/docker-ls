The author of Docker-ls refused patches with those shell scripts on top of
docker-ls, so here they are.

They are very useful if you want to do shell scripting on top of them.

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
