FROM    ubuntu:18.04

# This will make apt-get install without question
ARG	DEBIAN_FRONTEND=noninteractive
ARG     UHD_TAG=v3.14.0.0
ARG     MAKEWIDTH=2

#Install dependencies
RUN	apt-get update && apt-get install -y apt-utils
RUN	apt-get -y install 	gawk wget git diffstat unzip texinfo gcc-multilib \
				build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
				xz-utils debianutils iputils-ping libsdl1.2-dev xterm \
				autoconf libtool libglib2.0-dev libarchive-dev python-git \
				sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 \
				help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
				mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils pv \
				libncurses5 libncurses5-dev libncursesw5-dev libelf-dev zlib1g-dev bc

#Install System Locales																
RUN	apt-get -y install locales
RUN 	dpkg-reconfigure -f noninteractive locales
RUN 	echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen && locale-gen en_US.UTF-8
RUN 	update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
		
RUN	mkdir -p ~/bin
RUN	export PATH=~/bin:$PATH
RUN	curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
RUN	chmod a+x ~/bin/repo
RUN 	mv ~/bin/repo /usr/local/bin/repo

RUN	mkdir -p /home/oe-builder
RUN 	git config --global user.name "ni-smartracks-builder"
RUN	git config --global user.email ni-smartracks-builder@hotmail.com

WORKDIR /home/oe-builder
ENV 	LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
