# docker build -f Containerfile --no-cache --progress=plain -t registry-1.docker.io/caravanacloud/ubi-java:latest .
# docker push registry-1.docker.io/caravanacloud/ubi-java:latest
# docker image inspect caravanacloud/ubi-java:latest 
# docker run -it --rm caravanacloud/ubi-java:latest bash

# docker build -f Containerfile --no-cache --progress=plain -t registry-1.docker.io/caravanacloud/ubi-java:21 .
# docker push registry-1.docker.io/caravanacloud/ubi-java:21

ARG UBI=ghcr.io/graalvm/jdk-community:21

FROM $UBI

# Create user
ARG USERNAME=container-user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -d "/home/$USERNAME"

# User level
USER $USERNAME

# RUN java -version
# RUN mvn -version
