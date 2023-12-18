#Download base image ubuntu 20.04
FROM ubuntu:18.04

LABEL maintainer="charles@sentnl.io"
LABEL version="1.0"
LABEL description="EOSIO CDT"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Add user
RUN groupadd --gid 1001 eos \
   && useradd --uid 1001 --gid 1001 --shell /bin/bash --create-home --home /home/eos eos

# To prevent - Warning: apt-key output should not be parsed (stdout is not a terminal)
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Install required packages to add APT certifcate and APT REPOs
RUN apt update && apt install --no-install-recommends -y wget git keychain


# Pull in build argument
ARG CDT_BINARY
# Download CDT DEB 
RUN wget --no-check-certificate  $CDT_BINARY && \
# From the CDT URL get the filename and install
    filename=$CDT_BINARY; apt install -y ./"${filename##*/}"




RUN mkdir -p /eos && \
    chown eos:eos eos/

WORKDIR /eos
# Change to eos user
USER eos
#ADD files/hello.cpp .
#RUN eosio-cpp hello.cpp -o hello.wasm

CMD tail -f /dev/null
