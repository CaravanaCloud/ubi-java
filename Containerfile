# docker build -f Containerfile --no-cache --progress=plain -t caravanacloud/ubi-java:latest .
# docker push caravanacloud/ubi-java:latest
# docker image inspect caravanacloud/ubi-java:latest 
# docker run -it --rm caravanacloud/ubi-java:latest bash

# docker build -f Containerfile --no-cache --progress=plain -t caravanacloud/ubi-java:J21F39 .
# docker push caravanacloud/ubi-java:J21F39

ARG UBI=fedora:39

FROM $UBI

# Root level
USER root
ENV LANGUAGE='en_US:en'
RUN bash -c 'sudo dnf -y install curl unzip zip'

# Create user
ARG USERNAME=container-user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -d "/home/$USERNAME"

# User level
USER $USERNAME

ARG JAVA_SDK="21.0.1-graalce"
RUN curl -s 'https://get.sdkman.io' | bash
RUN source "/home/$USERNAME/.sdkman/bin/sdkman-init.sh" \
    && sdk install java $JAVA_SDK \
    && sdk default java $JAVA_SDK \
    && sdk install maven

ENV PATH="${PATH}:/home/$USERNAME/.sdkman/candidates/java/current/bin/"

RUN java -version
