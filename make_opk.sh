#!/bin/sh

OPK_NAME=tecnoballz.opk

echo ${OPK_NAME}

# move src/data to tmp/data and remove makefiles
mkdir tmp -p
cp src/data tmp -r
find tmp -type f -name 'Makefile*' -exec rm -f {} \;

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
FLIST="tmp/data"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} src/data/tecnoballz.png"
FLIST="${FLIST} src/tecnoballz"
FLIST="${FLIST} COPYING"
FLIST="${FLIST} README"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
rm -r tmp
