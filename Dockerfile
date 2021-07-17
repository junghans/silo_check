FROM ghcr.io/ecp-copa/cabana:latest

ARG PKGS

RUN if [[ -n ${PKGS} ]]; then \
  sudo dnf install -y ${PKGS//&/ }; \
fi 

RUN wget https://wci.llnl.gov/sites/wci/files/2021-01/silo-4.10.2.tgz
RUN tar -xvf silo-4.10.2.tgz
WORKDIR silo-4.10.2
RUN ./configure
RUN make -j5
