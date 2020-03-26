# osbuild and ostree integration demo

This repository is demonstrating how [osbuild][osbuild] can be used
to create [ostree][ostree] commits and then in turn images based on
that commit.
NB: It uses not yet released osbuild code (see [PR#282][pr282])

# installation
Clone the [repository][this] and its git sub-module with:

```
git clone --recurisve
```

The dependencies to run it are:
  - ostree
  - rpm
  - systemd-container


# usage
Build the `ostree` commit and the image via:
```
sudo ./osbuild-ostree build
```

Boot the final image with:
```
./osbuild-ostree boot
```

Cleanup the build directory with:
```
./osbuild-ostree cleanup
```

## Example output:
With the actual output of osbuild itself stripped,
this should give you something along the lines of:

```
Building the following pipeline:
build:
  runner:
    org.osbuild.fedora31
  stages:
    org.osbuild.rpm: 	2dcbcce84e0202ef20f819a52ce252a66b4433ef449f879557648619b827dd1c
runner:
  org.osbuild.fedora31
stages:
  org.osbuild.rpm: 	7005fc8469b54a23ce5223d187385bf402dde9d624db1cbda14a717c0b7965d3
  org.osbuild.systemd: 	4a102eb547e484f6c2847d06249bd9dc6a83fee3b59a87bed4b472440d8a2431
  org.osbuild.locale: 	bc330c673086db591200698789fd4e4cfbd1e78ac951b7fd9f70a142365dd6ad
  org.osbuild.fstab: 	40db0e1b6ecd1c295f815dcfce7404d2235f1631d10d05431d91cebeae2737de
  org.osbuild.selinux: 	7ce472966ce2660c6247c965d14f8f2fc5dd7ff17f8184af20c2d44f225d9148
  org.osbuild.rpm-ostree: 	fb4ec097c2b29858fc7b14ca2d4e628f3ef2c21a702d06dd1062f464790310b9
assembler:
  org.osbuild.ostree.commit: 	9c20d23e0c2d43f305c00d4a902c7ac6e259f2222d3bf6c3162c0d333d1a27e0

checkpointing rpm stage: 2dcbcce84e0202ef20f819a52ce252a66b4433ef449f879557648619b827dd1c
checkpointing rpm stage: 7005fc8469b54a23ce5223d187385bf402dde9d624db1cbda14a717c0b7965d3

...

Pipeline for ostree commit is done:
  output id: 9c20d23e0c2d43f305c00d4a902c7ac6e259f2222d3bf6c3162c0d333d1a27e0
  commit id: 9eb8e0db758a308a8a91e4f8c26aad2d1efaaea691a6784dc6e1a46b7d3bfe7b
Building the following pipeline:
build:
  runner:
    org.osbuild.fedora31
  stages:
    org.osbuild.rpm: 	2dcbcce84e0202ef20f819a52ce252a66b4433ef449f879557648619b827dd1c stored
runner:
  org.osbuild.fedora31
stages:
  org.osbuild.ostree: 	1a9ad4de7e9a3d96138156973cd0b29d0babf27e4b8cfe5725f595dbbe9bf10a
  org.osbuild.ostree.grub2: 	883b4da9cab2fd74b0d027d9a2a48a3a8043712c9508e7ad4719b297002d093f
assembler:
  org.osbuild.qemu: 	9a20ec3637c3feed05eeab19f93b86f35ef9343b5d3ae8d846497065377a1e24

checkpointing rpm stage: 2dcbcce84e0202ef20f819a52ce252a66b4433ef449f879557648619b827dd1c

...

Pipeline for ostree image is done:
  output id: 9a20ec3637c3feed05eeab19f93b86f35ef9343b5d3ae8d846497065377a1e24
      image: fedora-31-ostree.qcow2

Image ready at:
  /home/gicmo/Code/src/osbuild-iot/build/store/refs/9a20ec3637c3feed05eeab19f93b86f35ef9343b5d3ae8d846497065377a1e24/fedora-31-ostree.qcow2
```



[osbuild]: https://osbuild.org
[ostree]: https://ostree.readthedocs.io/en/latest/
[pr282]: https://github.com/osbuild/osbuild/pull/282
[this]: https://github.com/gicmo/ostree-osbuild-demo/
