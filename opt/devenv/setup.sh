echo "install_weak_deps=False" >> /etc/dnf/dnf.conf

dnf upgrade --assumeyes --quiet
dnf install --assumeyes --quiet --best @c-development @development-tools \
                                       @development-tools \
                                       @container-management \
                                       curl fish elixir emacs erlang \
                                       passwd util-linux

useradd --create-home --user-group --shell $(which fish) --groups wheel $1
passwd --delete $1

echo "su --login $1" >> /etc/opt/bootstrap/start.sh
