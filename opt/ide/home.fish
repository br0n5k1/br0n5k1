# Use Starship for shell prompt:
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Use ASDF to manage versions of Erlang, Elixir and Node.js:
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1

mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

source ~/.asdf/asdf.fish

asdf update

# FIXME Remove duplicate either from here or ~/.config/fish/config.fish
set -gx KERL_BUILD_BACKEND git
set -gx KERL_CONFIGURE_OPTIONS "--disable-debug"

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang latest
asdf global erlang latest

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir latest
asdf global elixir latest

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# Set up Rebar3:

curl https://s3.amazonaws.com/rebar3/rebar3 --output /tmp/rebar3
chmod +x /tmp/rebar3
/tmp/rebar3 local install
rm /tmp/rebar3

# Replace default configuration:
mv ~/.config/fish/config.fish.example ~/.config/fish/config.fish

exit