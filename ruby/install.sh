set -ex

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# Optionally, try to compile dynamic bash extension to speed up rbenv.
cd ~/.rbenv && src/configure && make -C src
if ! grep 'export PATH="$HOME/.rbenv/bin:$PATH"' ~/.bashrc; then
  echo >> ~/.bashrc
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)" # This initializes rbenv' >> ~/.bashrc
fi

# Install ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
