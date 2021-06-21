# Author: Stephan M. February <stephan@twostack.org>
#

FROM ubuntu:20.04

RUN apt-get -q update && apt-get install --no-install-recommends -y -q gnupg2 curl git ca-certificates apt-transport-https openssh-client \
    && apt-get install -y -q cron

# Download and install latest version of BitcoinSV Node
RUN curl https://download.bitcoinsv.io/bitcoinsv/1.0.8/bitcoin-sv-1.0.8-x86_64-linux-gnu.tar.gz -o /tmp/bitcoin-sv-1.0.8-x86_64-linux-gnu.tar.gz \
    && tar zxvf /tmp/bitcoin-sv-1.0.8-x86_64-linux-gnu.tar.gz -C /opt

# softlink bitcoin binaries into path
RUN ln -s /opt/bitcoin-sv-1.0.8/bin/bitcoin-cli /usr/bin \
     && ln -s /opt/bitcoin-sv-1.0.8/bin/bitcoind /usr/bin \
     && ln -s /opt/bitcoin-sv-1.0.8/bin/bitcoin-tx /usr/bin


# Create location for node's data
RUN mkdir -p /usr/var/bitcoin-data

# Place node config file in data folder
COPY bitcoin.conf /usr/var/bitcoin-data

COPY scheduler.txt /tmp

RUN crontab /tmp/scheduler.txt

ENTRYPOINT ["bitcoind", "-datadir=/usr/var/bitcoin-data"]
