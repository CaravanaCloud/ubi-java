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

# Set the working directory to the user's home directory
WORKDIR /home/$USERNAME

# Optionally, you can install Maven if it's needed for your Java projects
# For example, you can use the following commands to install Maven:
# ARG MAVEN_VERSION=3.8.4
# ENV MAVEN_HOME=/opt/maven
# ENV PATH=${MAVEN_HOME}/bin:${PATH}
# ADD --chown=${USERNAME}:${USERNAME} https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz /tmp
# RUN tar -xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt \
#     && ln -s /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} \
#     && rm -f /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Optionally, you can include commands to verify Java and Maven installations
# RUN java -version
# RUN mvn -version

# You can add any additional customization or tools required for your projects here

# This line is not necessary if you are not creating an image meant to be executed directly
CMD ["bash"]
