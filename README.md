# osbuild and ostree integration demo

This repository is demonstrating how [osbuild][osbuild] can be used
to create [ostree][ostree] commits and then in turn images based on
that commit.
NB: It uses not yet released osbuild code (see [PR#282][pr282])

It has been tested on Fedora 31.

# installation
Clone the [repository][this] and its git sub-module with:

```
git clone --recurisve
```

The dependencies to run it are:
  - rpm-ostree
  - qemu-img
  - dnf
  - e2fsprogs
  - policycoreutils
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
runner:
  org.osbuild.fedora31
stages:
  org.osbuild.dnf: 	0b2ea0bde7d67753d87ceaba6a94d63ee9166b80e0577c1a999c4cc4e0eb11b8 stored
  org.osbuild.systemd: 	85df13e616846623154da03ea2b0ac68f68b4622bd73c8b953d19bc555a6d1eb
  org.osbuild.locale: 	8a0baff611a3fede840e91c91ffc616770868f9c94a8c83c9f403705003f4aa9
  org.osbuild.fstab: 	7f6688c4d46d07ee7b5f9bbc5a53d45cf48cb5cd3464f56fac6060e4c22e9a3c
  org.osbuild.selinux: 	0e64cd3657b821ee478d2d3c384a7c1bb7256bacfbea9b86b60317c7564a2e21
  org.osbuild.rpm-ostree: 	c337883341881c01534fabf007060eebbe842ace326b4fd77bc57df3c16eab31
assembler:
  org.osbuild.ostree.commit: 	8fbb2b189608bfdbf3fd0bd3129bf453fc5633331d1fd3797455f7be9ab705b3 stored

checkpointing dnf stage: 0b2ea0bde7d67753d87ceaba6a94d63ee9166b80e0577c1a999c4cc4e0eb11b8

Pipeline for ostree commit is done:
  output id: 8fbb2b189608bfdbf3fd0bd3129bf453fc5633331d1fd3797455f7be9ab705b3
  commit id: 63081d95d528574a910144fcd0c008a413d793df2c49d1dacbb8489838586a4f
Building the following pipeline:
runner:
  org.osbuild.fedora31
stages:
  org.osbuild.ostree: 	3353a97d42ac1c873122ab67bb02f7d784f18beb7291c10d0a2ef0550c6869f6
  org.osbuild.ostree.grub2: 	0bd900be08d89c790895a68a7ccc05aae895845680772f190e1790fba9a05a5a
assembler:
  org.osbuild.qemu: 	678232f96d21fb49ad46a7f336ea29d0694b9b823757ea1464489755c28aeea1 stored


Pipeline for ostree image is done:
  output id: 678232f96d21fb49ad46a7f336ea29d0694b9b823757ea1464489755c28aeea1
      image: fedora-30-ostree.qcow2

Image ready at:
  /home/gicmo/Code/src/osbuild-iot/build/store/refs/678232f96d21fb49ad46a7f336ea29d0694b9b823757ea1464489755c28aeea1/fedora-30-ostree.qcow2
```



[osbuild]: https://osbuild.org
[ostree]: https://ostree.readthedocs.io/en/latest/
[pr282]: https://github.com/osbuild/osbuild/pull/282
[this]: https://github.com/gicmo/ostree-osbuild-demo/
