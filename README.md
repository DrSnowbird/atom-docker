# atom-docker

* Atom (1.28.2)+ Java 8 (1.8.0_181) JDK + Maven 3.5.0 + Python 3.5.2 + X11 (display GUI)

## Requirements
* Docker 1.13.1+ or latest 17.12.1-ce 
* An X11 server socket enabled (e.g. xhost+)

## Run (Recommended)
```
./run.sh
```

## (Optional) Build
Build your local images - instead of pulling from openkbs/intellij-docker to run
```
./build.sh
```
# Configurations (Optional)
If you run "./run.sh" instead of "docker-compose up", you don't have to do anything as below.
* The container uses a default "/workspace" folder. 
* The script "./run.sh" will re-use or create the local folder in your $HOME directory with the path below to map into the docker's internal "/workspace" folder.
```
$HOME/data_docker/eclipse-oxygen-docker/workspace
```
The above configuration will ensure all your projects created in the container's "/workspace" being "persistent" in your local folder, "$HOME/data_docker/eclipse-oxygen-docker/workspace", for your repetitive restart docker container.

# Display X11 Issue
More resource in X11 display of Eclipse on your host machine's OS, please see
* [X11 Display problem](https://askubuntu.com/questions/871092/failed-to-connect-to-mir-failed-to-connect-to-server-socket-no-such-file-or-di)
* [X11 Display with Xhost](http://www.ethicalhackx.com/fix-gtk-warning-cannot-open-display/)

# Other Docker-based IDE
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/atom-java-mvn-python3](https://hub.docker.com/r/openkbs/atom-java-mvn-python3/)
* [openkbs/docker-atom-editor](https://hub.docker.com/r/openkbs/docker-atom-editor/)
* [openkbs/protege-docker-x11](https://hub.docker.com/r/openkbs/pycharm-docker/)

# Reference
* [Atom](https://atom.io/)

