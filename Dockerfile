FROM ubuntu:24.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        git \
        make \
        g++ \
        libgsl-dev \
        libstdc++6 && \
    apt clean

WORKDIR /tmp

RUN git clone https://github.com/frederic-mahe/mumu.git && \
    cd mumu && \
    gcc --version && \
    make && \
    make check && \
    make install

RUN rm -rf /tmp/mumu && \
    apt purge -y git make g++ && \
    apt autoremove -y && \
    apt clean

ENTRYPOINT ["mumu"]
CMD []
