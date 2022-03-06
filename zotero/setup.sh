#!/bin/bash

sudo apt install -y \
    curl

curl -sL https://apt.retorque.re/file/zotero-apt/install.sh | sudo bash

sudo apt update
sudo apt install -y \
    zotero
