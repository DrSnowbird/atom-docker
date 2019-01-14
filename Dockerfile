FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

# Release: https://github.com/atom/atom/releases/

## ---- USER is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
ENV USER=${USER:-developer}
ENV HOME=/home/${USER}

###############################
#### --- Atom Install ---- ####
###############################
ARG ATOM_VERSION=${ATOM_VERSION:-v1.34.0}
ENV ATOM_VERSION=${ATOM_VERSION}
ENV ATOM_PACKAGE=${ATOM_PACKAGE:-atom-amd64.deb}

user 0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    fakeroot \
    gconf2 \
    gconf-service \
    gvfs-bin \
    libasound2 \
    libcap2 \
    libgconf-2-4 \
    libgtk2.0-0 \
    libnotify4 \
    libnss3 \
    libxkbfile1 \
    libxss1 \
    libxtst6 \
    libcurl3 \
    xdg-utils && \
    curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/${ATOM_PACKAGE} > /tmp/${ATOM_PACKAGE} && \
    dpkg -i /tmp/${ATOM_PACKAGE} && \
    rm -f /tmp/${ATOM_PACKAGE} && \
    useradd -d /home/atom -m atom

#############################################
#### --- Atom add-on plugin Install ---- ####
#############################################
RUN apm install language-docker atom-django

###########################################
#### --- Enterpoint for container ---- ####
###########################################
USER ${USER}
WORKDIR ${HOME}

ENV DATA=${HOME}/data
ENV WORKSPACE=${HOME}/workspace
RUN mkdir -p ${WORKSPACE} ${DATA}

VOLUME ${DATA}
VOLUME ${WORKSPACE}
VOLUME ${HOME}/.atom 

CMD ["/usr/bin/atom","-f"]

#### (debug only)
#CMD ["/usr/bin/firefox"]
#CMD ["/bin/bash"]


