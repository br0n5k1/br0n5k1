echo "install_weak_deps=False" >> /etc/dnf/dnf.conf

dnf upgrade --assumeyes --quiet
dnf install --assumeyes --quiet --best @c-development @development-tools \
                                       @development-tools \
                                       @container-management \
                                       buildah curl fish fop emacs-nox \
                                       java-latest-openjdk-devel \
                                       ncurses-devel openssl-devel passwd \
                                       ruby rubygems tmux unixODBC-devel \
                                       util-linux which xsltproc

dnf install --assumeyes --quiet 'dnf-command(config-manager)'
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install gh --assumeyes --quiet
 
gem install tmuxinator

useradd --create-home --user-group --shell $(which fish) --groups wheel $1
passwd --delete $1

mkdir /project

echo 'su --login $1 --command "tmuxinator start --project-config ~$1/.config/tmuxinator/IDE.yml"' >> \
     /etc/opt/$(dirname $0 | xargs basename)/start.sh
