FROM ubuntu:24.04

RUN apt update && \
	apt upgrade -y && \
	apt install -y git make g++ libgsl-dev && \
	apt clean

WORKDIR /usr/src

RUN git clone https://github.com/frederic-mahe/mumu.git && \
	cd mumu && \
	make && \
	make check && \
	make install

ENV PATH="${PATH}:/usr/src/mumu"
