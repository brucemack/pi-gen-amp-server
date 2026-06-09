#!/bin/bash -e
#export AMP_SERVER_VERSION=20260609
#export AMP_ARCH=$(uname -m)
# Pull in the amp-server package and untar it
wget -P ../files/tmp https://ampersand-asl.s3.us-west-1.amazonaws.com/releases/amp-${AMP_SERVER_VERSION}-${AMP_ARCH}.tar.gz
tar xvf ../files/tmp/amp-${AMP_SERVER_VERSION}-${AMP_ARCH}.tar.gz -C ../files/tmp
install -m 755 ../files/tmp/amp-${AMP_SERVER_VERSION}-${AMP_ARCH}/amp-server "${ROOTFS_DIR}/usr/bin/amp-server"
#install -m 755 ../files/usr/bin/amp-server "${ROOTFS_DIR}/usr/bin/amp-server"
# Optional: Run any additional configuration inside the chroot environment
on_chroot << EOF
chmod +x /usr/bin/amp-server
EOF
# Setup service
install -m 755 ../files/lib/systemd/system/amp-server.service "${ROOTFS_DIR}/lib/systemd/system/amp-server.service"
on_chroot << EOF
systemctl enable amp-server.service
EOF
# Rules to adjust permissions on CM108 HID
install -m 755 ../files/etc/udev/rules.d/99-cm108-ampersand.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-cm108-ampersand.rules"
