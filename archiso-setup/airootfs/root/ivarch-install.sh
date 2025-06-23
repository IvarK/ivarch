#!/bin/bash

git clone https://github.com/IvarK/ivarch.git --depth 1
cd ivarch
sudo chmod +x ivarch-install.sh
sudo chown ivar:ivar ivarch-install.sh

./ivarch-install.sh