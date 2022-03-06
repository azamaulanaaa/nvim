#!/bin/bash

sudo apt install -y \
    curl

bash <(curl -L https://nixos.org/nix/install) --daemon
