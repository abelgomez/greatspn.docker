FROM docker.io/fedora:31

EXPOSE 22

RUN dnf -y update
RUN dnf -y install 'dnf-command(config-manager)'

RUN dnf config-manager --add-repo https://www.lrde.epita.fr/repo/fedora/lrde.repo

RUN dnf -y update
RUN dnf -y install \
  openssh-server \
  passwd \
  gcc \
  gcc-c++ \
  gmp-devel \
  gmp-c++ \
  gmp \
  boost-devel \
  flex-devel \
  ant \
  glib2-devel \
  patch \
  python \
  glpk-devel \
  lpsolve-devel \
  autoconf \
  automake \
  libtool \
  zip \
  flex \
  git \
  byacc \
  time \
  graphviz \
  suitesparse-devel \
  motif-devel \
  make \
  libxml++-devel \
  glibmm24-devel \
  lpsolve \
  spot \
  python3-spot \
  spot-devel \
  spot-doc

RUN git clone https://github.com/asminer/meddly.git ~/meddly
RUN cd ~/meddly/ && ./autogen.sh
RUN cd ~/meddly/ && ./configure CXXFLAGS="-O2 -w" --prefix=/usr/local
RUN cd ~/meddly/ && make install

RUN git clone https://github.com/greatspn/SOURCES.git ~/GreatSPN
RUN cd ~/GreatSPN && CFLAGS="-O2 -w" CXXFLAGS="-O2 -w" make install

RUN dnf clean all

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]