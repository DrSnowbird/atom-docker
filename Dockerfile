FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

# Release: https://github.com/atom/atom/releases/

## ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}
ENV ATOM_VERSION=${ATOM_VERSION:-v1.29.0}
ENV ATOM_PACKAGE=${ATOM_PACKAGE:-atom-amd64.deb}

#COPY ${ATOM_PACKAGE} /tmp/
RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends \
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
    xdg-utils && \
    curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/${ATOM_PACKAGE} > /tmp/${ATOM_PACKAGE} && \
    sudo dpkg -i /tmp/${ATOM_PACKAGE} && \
    rm -f /tmp/${ATOM_PACKAGE} && \
    sudo useradd -d /home/atom -m atom

USER ${USER_NAME}
WORKDIR ${HOME}

RUN \
    mkdir -p ${HOME}/workspace  && \
    apm install language-docker atom-django

VOLUME ${HOME}/workspace
VOLUME ${HOME}/.atom 

CMD ["/usr/bin/atom","-f"]

