FROM ubuntu:xenial

ARG KURA_VERSION=4.1.2

RUN apt-get update

RUN apt-get install openjdk-8-jdk --yes
RUN apt-get --yes install apt-utils
RUN apt-get --yes install wget bluetooth gdebi-core procps usbutils
RUN wget -q http://download.eclipse.org/kura/releases/${KURA_VERSION}/kura_${KURA_VERSION}_raspberry-pi-2-3-nn_installer.deb && yes | gdebi kura_${KURA_VERSION}_raspberry-pi-2-3-nn_installer.deb

#Clean up
RUN rm kura_${KURA_VERSION}_raspberry-pi-2-3-nn_installer.deb && \
	apt-get --yes remove	gdebi-core && \
	apt-get --yes autoremove && \
	apt-get --yes clean

EXPOSE 80

CMD ["/opt/eclipse/kura/bin/start_kura.sh"]
