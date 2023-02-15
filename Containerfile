FROM fedora:latest

ARG USER

COPY opt/devenv /opt/devenv
COPY etc/opt/devenv /etc/opt/devenv
COPY etc/skel /etc/skel

RUN sh -x /opt/devenv/setup.sh ${USER}

CMD sh -x /etc/opt/devenv/start.sh
