# this image augments Ubuntu 16.04 with the minimum necessary to run Yocto with support for QEMU and devtool
FROM ubuntu:16.04

# Configure timezone
ARG TZ=America/Los_Angeles
RUN echo Timezone: $TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Configure locales
RUN apt-get update && apt-get -y upgrade && apt-get -y install locales apt-utils sudo && \
        dpkg-reconfigure locales && locale-gen en_US.UTF-8 && \
        update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

# Create yocto user
ARG USER=yocto
RUN useradd --create-home $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Yocto Proyect basic dependencies and extras
RUN apt-get -y install kmod gawk wget git-core diffstat unzip texinfo \
gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils \
iputils-ping libsdl1.2-dev xterm curl vim tzdata bc

# for tunctl (qemu)
RUN apt-get -y install uml-utilities

# for package feeds
RUN apt-get -y install lighttpd

# for bitbake -g
RUN apt-get -y install python3-gi python-pip python3-aptdaemon.gtk3widgets

# Add i.MX layers
RUN apt-get -y install libsdl1.2-dev xterm sed cvs subversion \
        coreutils texi2html docbook-utils python-pysqlite2 help2man gcc \
        g++ make desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
        mercurial autoconf automake groff curl lzop asciidoc u-boot-tools

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install repo
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo &&\
        chmod a+x /usr/local/bin/repo

COPY assets /