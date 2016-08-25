FROM ubuntu:14.04

ENV PARITY_DEB_URL=https://vanity-service.ethcore.io/github-data/latest-parity-deb

RUN apt-get update
RUN apt-get install -y -qq curl expect expect-dev

# install parity #

RUN curl -Lk $PARITY_DEB_URL > /tmp/parity.deb
RUN dpkg -i /tmp/parity.deb

RUN mkdir -p /root/.parity/keys
COPY key.json /root/.parity/keys/
COPY key.pass /root/
COPY chain.json /root/

EXPOSE 8545 

ENTRYPOINT ["parity", "--chain", "/root/chain.json", "--author", "133e5245e3e5ab3f65e73120b34cc29f0f7ba504", "--unlock", "133e5245e3e5ab3f65e73120b34cc29f0f7ba504", "--password", "/root/key.pass", "--rpccorsdomain", "*", "--jsonrpc-interface", "all", "--jsonrpc-hosts", "all", "--no-dapps", "--no-signer"]
