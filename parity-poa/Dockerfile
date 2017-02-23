FROM ubuntu:16.04

RUN apt-get update && apt-get install -y -qq curl 

RUN mkdir -p /root/.local/share/io.parity.ethereum/keys/PrivateChain/
COPY key.json /root/.local/share/io.parity.ethereum/keys/PrivateChain/
COPY key.pass /root/
COPY chain.json /root/

EXPOSE 8545 

COPY entry.sh /root/
RUN chmod +x /root/entry.sh

ENTRYPOINT ["/root/entry.sh"]
