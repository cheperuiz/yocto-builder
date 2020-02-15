#!/bin/bash

git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME

mkdir fsl-arm-yocto-bsp

cd fsl-arm-yocto-bsp
repo init -u https://source.codeaurora.org/external/imx/imx-manifest \
        -b imx-linux-sumo -m imx-4.14.98-2.0.0_machinelearning.xml
        
repo sync