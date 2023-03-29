FROM --platform=linux/amd64 ubuntu:22.04

WORKDIR "/root"

RUN apt update && apt install -y git gcc g++ pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev libusb-1.0-0-dev cmake \
     && rm -rf /var/lib/apt/lists/*

RUN mkdir tools

COPY scripts/download.sh ./
RUN ./download.sh

COPY scripts/prepare/install.sh ./
RUN ./install.sh

COPY scripts/build/setup_env.sh ./

SHELL ["/bin/bash", "-c"] 
RUN . ./setup_env.sh && pip3 install lark stringcase

RUN rm download.sh install.sh setup_env.sh

CMD ./scripts/prepare/apply_patch.sh ; ./scripts/build_locally.sh
