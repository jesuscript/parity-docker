FROM ubuntu:14.04
WORKDIR /build
# install tools and dependencies
RUN apt-get update && \
        apt-get install -y \
        g++ \
        curl \
        git \
        file \
        binutils \
        make

# install rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# rustup directory
ENV PATH /root/.cargo/bin:$PATH

# show backtraces
ENV RUST_BACKTRACE 1

# show tools
RUN rustc -vV && \
cargo -V && \
gcc -v &&\
g++ -v

# build parity
RUN git clone https://github.com/ethcore/parity && \
        cd parity && \
        git checkout master && \
        git pull && \
        cargo build --release --verbose && \
        ls /build/parity/target/release/parity && \
        strip /build/parity/target/release/parity

RUN file /build/parity/target/release/parity

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install nodejs -y

RUN cd $HOME && \
    git clone https://github.com/cubedro/eth-net-intelligence-api netstats && \
    cd netstats && \
    npm install
    
RUN npm install -g pm2 

EXPOSE 8080 8545 8180

COPY start-stats.sh /usr/bin/start-parity-with-stats
RUN chmod +x /usr/bin/start-parity-with-stats
RUN ln -s /build/parity/target/release/parity /usr/bin/parity
