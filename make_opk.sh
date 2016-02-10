#!/bin/sh

OPK_NAME=tecnoballz.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=Tecnoballz
Comment=Breakout
Exec=tecnoballz
Terminal=false
Type=Application
StartupNotify=true
Icon=tecnoballz
Categories=games;
EOF

# create opk
FLIST="src/data"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} src/data/tecnoballz.png"
FLIST="${FLIST} src/tecnoballz"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
