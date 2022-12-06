FROM debian:11 as build

# Base image for devcontainers.
# Build with docker build -t devbase .

RUN apt-get update \
  && apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git golang-go scdoc make

RUN mkdir /buildtarget
RUN git clone https://github.com/neovim/neovim \
  && cd neovim \
  && git checkout stable 
WORKDIR /neovim
RUN make CMAKE_BUILD_TYPE=Release 
RUN make CMAKE_INSTALL_PREFIX=/buildtarget install

RUN curl https://git.sr.ht/~gpanders/ijq/archive/v0.4.1.tar.gz | tar xzf - \
  && cd ijq-v0.4.1 \
  && make prefix=/buildtarget install

FROM debian:11 as base

WORKDIR /usr/local
COPY --from=build /buildtarget .

CMD ["bash"]
