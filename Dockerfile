FROM quay.io/ucsc_cgl/toil:3.20.0-cf34ca3416697f2abc816b2538f20ee29ba16932

# Install:
# git to clone your project onto the leader
# vim to have a text editor
# synapseclient to download synapse data
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y dist-upgrade && \
  apt-get -y install git vim && \
  pip install --upgrade pip && \
  pip install 'synapseclient==1.9.2'

RUN mkdir /root/jobs

ENV TMPDIR /var/lib/toil

WORKDIR /root/jobs
