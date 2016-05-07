FROM fedora
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

VOLUME "/run/saslauthd"
COPY fork_proxy.sh /usr/sbin/fork_proxy.sh
RUN dnf install -y cyrus-sasl cyrus-sasl-plain && dnf clean all
CMD /usr/sbin/fork_proxy.sh /run/saslauthd/saslauthd.pid /usr/sbin/saslauthd -m /run/saslauthd -a ${AUTH_MECH} -rO ${AUTH_ARGS}
