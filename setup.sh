#!/bin/bash
curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
sudo apt update
sudo apt install crystal
sudo apt install libssl-dev
sudo apt install libxml2-dev
sudo apt install libyaml-dev
sudo apt install libgmp-dev
sudo apt install libz-dev

