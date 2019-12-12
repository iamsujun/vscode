FROM debian

RUN apt-get update

RUN apt-get install -y curl git gcc g++ make pkg-config \
    libx11-dev libxkbfile-dev libsecret-1-dev fakeroot rpm 

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install yarn


WORKDIR /data
ADD . /data/vscode

RUN cd /data/vscode && yarn
