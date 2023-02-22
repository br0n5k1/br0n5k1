FROM registry.fedoraproject.org/fedora:latest

ARG NICK

COPY opt/ide /opt/ide
COPY etc/opt/ide /etc/opt/ide
COPY etc/skel /etc/skel

RUN sh -x /opt/ide/setup.sh ${NICK}
RUN su --login ${NICK} --command "fish /opt/ide/home.fish"

CMD sh -x /etc/opt/ide/start.sh
