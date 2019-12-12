FROM debian

RUN apt-get update

RUN apt-get install -y curl git nodejs make pkg-config \
    libx11-dev libxkbfile-dev libsecret-1-dev fakeroot rpm

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install yarn

WORKDIR /data
ADD . /data/vscode

RUN cd /data/vscode && yarn
