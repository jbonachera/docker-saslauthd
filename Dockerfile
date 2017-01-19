FROM jbonachera/arch
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

VOLUME "/run/saslauthd"
RUN  pacman -S --noconfirm cyrus-sasl
CMD /usr/sbin/saslauthd -dm /run/saslauthd -a ${AUTH_MECH} -rO ${AUTH_ARGS}
