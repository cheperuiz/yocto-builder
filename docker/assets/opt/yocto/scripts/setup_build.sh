#!/bin/bash


cd ${WORKSPACE}/fsl-arm-yocto-bsp

EULA=1 
MACHINE=imx8qmmek 
DISTRO=fsl-imx-xwayland 

source ./fsl-setup-release.sh -b build-xwayland

echo "BBLAYERS += \" \${BSPDIR}/sources/meta-imx-machinelearning \"" >> conf/bblayers.conf

cp ~/workspace/eiq.conf conf/eiq.conf

cat "conf/eiq.conf" >> conf/local.conf

