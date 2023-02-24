set fish_trace on

mkdir --parents ~/.local/bin

# Use Starship for shell prompt:
curl --silent --show-error https://starship.rs/install.sh | sh -s -- --yes

# Use ASDF to manage versions of Erlang, Elixir and Node.js:
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

source ~/.asdf/asdf.fish

asdf update

# FIXME Remove duplicate either from here or ~/.config/fish/config.fish
set -gx KERL_BUILD_BACKEND git
set -gx KERL_CONFIGURE_OPTIONS "--without-wx"

# FIXME ASDF fails to install, see https://github.com/asdf-vm/asdf-erlang/issues/269
# FIXME Changed back to system package, revert when the bug is resolved, see ./setup.sh
# asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
# asdf install erlang latest
# asdf global erlang latest

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir latest
asdf global elixir latest

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# Set up Rebar3:
curl https://s3.amazonaws.com/rebar3/rebar3 --output /tmp/rebar3
chmod +x /tmp/rebar3
/tmp/rebar3 local install
rm /tmp/rebar3

# Set up MITM proxy:
curl --silent --show-error https://snapshots.mitmproxy.org/9.0.1/mitmproxy-9.0.1-linux.tar.gz \
     --output /tmp/mitmproxy.tar.gz
tar xf /tmp/mitmproxy.tar.gz --directory ~/.local/bin
rm /tmp/mitmproxy.tar.gz

# Set up Emacs dependencies:
emacs --batch --load ~/.emacs --eval "(kill-emacs)"

# Replace default configuration:
mv ~/.config/fish/config.fish.example ~/.config/fish/config.fish

exit