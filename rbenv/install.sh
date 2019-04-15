set -ex

# Install rbenv
# https://github.com/rbenv/rbenv#basic-github-checkout

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# Optionally, try to compile dynamic bash extension to speed up rbenv.
cd ~/.rbenv && src/configure && make -C src

# Install ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
