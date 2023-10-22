FROM --platform=linux/amd64 debian:12

WORKDIR /tmp/
ARG DEST=/usr/local/bin

RUN apt-get update \
  && apt-get install -y \
     apt-transport-https \
     asciinema \
     bash-completion \
     bc \
     build-essential \
     ca-certificates \
     cron \
     curl \
     delta \
     dnsutils \
     entr \
     exiftool \
     fd-find \
     file \
     fzf \
     gnupg \
     golang \
     highlight \
     iputils-ping \
     jq \
     libevent-dev \
     libgraph-easy-perl \
     lsb-release \
     man \
     miller \
     ncat \
     ncurses-dev \
     nodejs \
     npm \
     neofetch \
     openssh-server \
     pandoc \
     pass \
     postgresql \
     ripgrep \
     shellcheck \
     sudo \
     toot \
     uuid-runtime \
     w3m \
     wamerican-small \
     wget \
     yq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Cloud Foundry CLI binary (package approach uses deprecated apt-key)
RUN curl \
    --location \
    --url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github' \
    | tar xzf - -C $DEST cf cf8

# tmux - terminal multiplexer
ARG TMUXVER=3.3a
RUN curl -fsSL "https://github.com/tmux/tmux/releases/download/$TMUXVER/tmux-$TMUXVER.tar.gz" \
  | tar -xzf - \
  && cd "tmux-$TMUXVER" && ./configure && make && make install

# Latest stable neovim release
ARG NVIMVER=0.9.4
RUN cd /tmp/ \
  && curl -sL https://github.com/neovim/neovim/releases/download/v${NVIMVER}/nvim-linux64.tar.gz \
  | tar xzf - -C /usr --strip-components 1

# bat - cat with wings
ARG BATVER=0.24.0
RUN curl -fsSLO "https://github.com/sharkdp/bat/releases/download/v$BATVER/bat-musl_${BATVER}_amd64.deb" \
  && dpkg -i "./bat-musl_${BATVER}_amd64.deb"

# glow - terminal based Markdown rendering
ARG GLOWVER=1.5.1
RUN curl -sLO "https://github.com/charmbracelet/glow/releases/download/v${GLOWVER}/glow_${GLOWVER}_amd64.deb" \
  && dpkg -i "./glow_${GLOWVER}_amd64.deb"

# gh - CLI for GitHub
ARG GHVER=2.37.0
RUN curl -LO "https://github.com/cli/cli/releases/download/v${GHVER}/gh_${GHVER}_linux_amd64.deb" \
  && dpkg -i "./gh_${GHVER}_linux_amd64.deb"

# Install lf - a terminal file manager
ARG LFVER=31
RUN curl -sL "https://github.com/gokcehan/lf/releases/download/r${LFVER}/lf-linux-amd64.tar.gz" \
  | tar -C "$DEST" -xzf - lf

# Install shfmt - shell script formatter
ARG SHFMTVER=3.7.0
RUN curl -sL "https://github.com/mvdan/sh/releases/download/v${SHFMTVER}/shfmt_v${SHFMTVER}_linux_amd64" -o "$DEST/shfmt" && chmod +x "$DEST/shfmt"

# Install kubectl - Kubernetes CLI
RUN curl -sL "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o "$DEST/kubectl" && chmod +x "$DEST/kubectl"

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install ijq
ARG IJQVER=0.4.0
RUN curl \
    --silent \
    --location \
    --url "https://git.sr.ht/~gpanders/ijq/refs/download/v$IJQVER/ijq-$IJQVER-linux-amd64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory $DEST \
      --strip-components 1 \
      --wildcards \
      ijq-$IJQVER/ijq

# Install Exercism
ARG EXERCISMVER=3.2.0
RUN curl \
    --silent \
    --location \
    --url "https://github.com/exercism/cli/releases/download/v$EXERCISMVER/exercism-$EXERCISMVER-linux-x86_64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory $DEST \
      exercism

# Install slides (presentations in terminal)
ARG SLIDESVER=0.9.0
RUN curl \
    --silent \
    --location \
    --url "https://github.com/maaslalani/slides/releases/download/v$SLIDESVER/slides_${SLIDESVER}_linux_amd64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory $DEST \
      slides

# Install ngrok
ARG NGROKVER=3
RUN curl \
    --silent \
    --location \
    --url "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v${NGROKVER}-stable-linux-amd64.tgz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory $DEST \
      ngrok

# Clean up temp dir
RUN rm -rf /tmp/*

# Set up non-root user
ARG USERNAME=user
RUN adduser \
  --quiet \
  --disabled-password \
  --shell /bin/bash \
  --home /home/$USERNAME \
  --gecos "Dev User" \
  $USERNAME \
  && chown $USERNAME:$USERNAME /tmp/

RUN mkdir /home/$USERNAME/.npm-global \
  && chown $USERNAME:$USERNAME /home/$USERNAME/.npm-global

USER $USERNAME
WORKDIR /home/$USERNAME
ENV TERM xterm-256color

# Install btp CLI
RUN cd /tmp/ \
  && curl \
  --remote-name \
  --location \
  --url "https://raw.githubusercontent.com/SAP-samples/sap-tech-bytes/2021-09-01-btp-cli/getbtpcli" \
  && chmod +x getbtpcli \
  && echo -ne '\n' | ./getbtpcli

# Install global npm modules for Node.js
#RUN npm config set prefix "/home/$USERNAME/.npm-global"
#RUN npm install -g \
#  @sap/cds-dk \
#  @sap/generator-fiori \
#  @sapui5/generator-sapui5-templates \
#  @ui5/cli \
#  bash-language-server \
#  docsify-cli \
#  eslint \
#  fx \
#  http-server \
#  httpie \
#  jwt-cli \
#  lodash \
#  lorem-ipsum \
#  markdownlint-cli \
#  prettier \
#  ramda \
#  url-decode-encode-cli \
#  yarn \
#  yo

# Set up dotfiles
RUN git clone https://github.com/qmacro/dotfiles.git && cd dotfiles/ && ./dotsetup

# Add extra bashrc.d file to append $HOME/.npm-global/bin to $PATH
RUN echo 'export PATH=$PATH:$HOME/.npm-global/bin' > $HOME/dotfiles/bashrc.d/99-docker-npm-global-bin-path.sh

# Set focus reminder
RUN echo "What are you focusing on?" | tee "$HOME/.status" > "$HOME/.focus"

# Off we go - based on tmux, the terminal multiplexer
CMD ["tmux", "-u", "new", "-s", "main"]
