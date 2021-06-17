FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:14

ARG cmdTools=7302050
ARG androidVersion=30
ARG buildToolVersion=30.0.3

# install Java 8

RUN apt update && apt install --yes software-properties-common

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -

RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

RUN apt update && apt install --yes adoptopenjdk-8-hotspot gradle

ENV JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/jre

# install android sdk commandline tools

WORKDIR /usr/android/sdk

# download commandline tools
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-${cmdTools}_latest.zip

# extract comandline tools to expected folder structure
RUN unzip commandlinetools-linux-${cmdTools}_latest.zip
RUN mkdir /usr/android/sdk/latest
RUN mv /usr/android/sdk/cmdline-tools/* /usr/android/sdk/latest
RUN mv /usr/android/sdk/latest /usr/android/sdk/cmdline-tools/latest

# set android sdk environment
ENV ANDROID_SDK_ROOT=/usr/android/sdk
ENV PATH=${PATH}:/usr/android/sdk/platform-tools/:/usr/android/sdk/tools/

# install packages with sdkmanager
WORKDIR /usr/android/sdk/cmdline-tools/latest/bin
RUN yes | ./sdkmanager "platform-tools" "platforms;android-${androidVersion}" "build-tools;${buildToolVersion}"

# install cordova
RUN npm i -g cordova cordova-res --unsafe-perm

# install ionic
RUN npm install -g @angular/cli @ionic/cli 

# Keep container alive
CMD exec /bin/bash -c "echo Container started ; trap \"exit 0\" 15; while sleep 1 & wait $!; do :; done"
