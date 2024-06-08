# Simulate the packaging build locally

Need to do this to patch warnings that are treated as errors
due to the build flags set by dpkg-buildflags.

## Prepare
```
sudo apt install debhelper
dpkg-checkbuilddeps
git clone git@github.com:aosmw/ortools_vendor.git
```

## Build it
```
cd ortools_vendor
dpkg-buildpackage -d -b
```

## Rebuild it
```
cd .obj-x86_64-linux-gnu
make -j10
```

## Make fixes and make a patch
cd .obj-x86_64-linux-gnu/ortools_vendor-prefix/src/ortools_vendor/
git diff > ../../../../0001-sciperrormessage.patch

## Notes dpkg-buildflags on ubuntu-22.04
```
dpkg-buildflags
ASFLAGS=
CFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security
CPPFLAGS=-Wdate-time -D_FORTIFY_SOURCE=2
CXXFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security
DFLAGS=-frelease
FCFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong
FFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong
GCJFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -fstack-protector-strong
LDFLAGS=-Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro
OBJCFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security
OBJCXXFLAGS=-g -O2 -ffile-prefix-map=/home/wakem/contrib_github/n2/src/ros-deb-builder-action/src/ortools_vendor=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security
```
