FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y \
  build-essential \
  gcc \
  gfortran \
  git \
  csh \
  # DEBUG
  vim

WORKDIR /opt

ADD cns_solve_1.3_all.tar.gz .

WORKDIR /opt/cns_solve_1.3

RUN sed -i 's@_CNSsolve_location_@'"$PWD"'@' cns_solve_env

WORKDIR /opt
RUN git clone --depth=1 https://github.com/haddocking/haddock3 && \
  cp -r /opt/haddock3/varia/cns1.3/[bis]* /opt/cns_solve_1.3/ && \
  rm -rf /opt/haddock3

WORKDIR /opt/cns_solve_1.3

COPY Makefile /opt/cns_solve_1.3/instlib/machine/supported/intel-x86_64bit-linux/Makefile.header.2.gfortran

RUN make install && \
  find /opt/cns_solve_1.3 -name "cns_solve-*.exe" -type f -exec cp {} /opt/cns_static \;

