#!/bin/bash

PARITY_BIN_URL=http://d1h4xl4cr1h0mo.cloudfront.net/beta/x86_64-unknown-linux-gnu/parity

curl -Lk $PARITY_BIN_URL > /root/parity
chmod +x /root/parity

/root/parity --chain /root/chain.json --author 133e5245e3e5ab3f65e73120b34cc29f0f7ba504 --unlock 133e5245e3e5ab3f65e73120b34cc29f0f7ba504 --password /root/key.pass --jsonrpc-cors '*' --jsonrpc-interface all --jsonrpc-hosts all --no-dapps --no-ui
