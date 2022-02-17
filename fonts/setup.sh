#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "$HOME/.fonts/"
ln -s $SCRIPT_DIR/files/ $HOME/.fonts/myFonts
