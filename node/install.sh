set -ex

# Install nvm
sudo apt-get remove --purge node
sudo apt-get install build-essential checkinstall libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
source ~/.bashrc
bash -ic "nvm install node"

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
