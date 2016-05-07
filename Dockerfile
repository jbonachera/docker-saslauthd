FROM fedora
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

VOLUME "/run/saslauthd"
COPY fork_proxy.sh /usr/sbin/fork_proxy.sh
RUN dnf install -y cyrus-sasl && dnf clean all
CMD ["/usr/sbin/fork_proxy.sh", "/run/saslauthd/saslauthd.pid", "/usr/sbin/saslauthd", "-m", "/run/saslauthd" ,"-a" ,"pam"]
