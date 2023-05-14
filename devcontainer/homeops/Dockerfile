FROM devbase as base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

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
    entr \
    exiftool \
    file \
    fzf \
    gnupg \
    jq \
    libevent-dev \
    libgraph-easy-perl \
    lsb-release \
    lynx \
    man \
    ncat \
    ncurses-dev \
    neofetch \
    openssh-server \
    pandoc \
    pass \
    postgresql \
    shellcheck \
    sudo \
    unzip \
    uuid-runtime \
    w3m \
    wamerican-small \
    wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/
ARG DEST=/usr/local/bin

ARG ARCH=arm64

# Install tmux - terminal multiplexer
ARG TMUXVER=3.2a
RUN curl -fsSL "https://github.com/tmux/tmux/releases/download/$TMUXVER/tmux-$TMUXVER.tar.gz" | tar -xzf - \
  && cd "tmux-$TMUXVER" && ./configure && make && make install

# Install specific Node.js
ARG NODEVER=lts
RUN curl -fsSL "https://deb.nodesource.com/setup_$NODEVER.x" | bash - && apt-get install -y nodejs

# Install global npm modules for Node.js
RUN npm install -g \
  @sap/cds-dk \
  @sap/generator-fiori \
  @sapui5/generator-sapui5-templates \
  @ui5/cli \
  bash-language-server \
  docsify-cli \
  eslint \
  fx \
  http-server \
  httpie \
  jwt-cli \
  lodash \
  lorem-ipsum \
  markdownlint-cli \
  prettier \
  ramda \
  unzip \
  url-decode-encode-cli \
  yarn \
  yo

# Install gh - CLI for GitHub
ARG GHVER=2.28.0
RUN curl -fsSLO "https://github.com/cli/cli/releases/download/v${GHVER}/gh_${GHVER}_linux_${ARCH}.deb" && dpkg -i "./gh_${GHVER}_linux_${ARCH}.deb"

# Install yq - YAML query tool
ARG YQVER=4.16.1
RUN curl -fsSL "https://github.com/mikefarah/yq/releases/download/v${YQVER}/yq_linux_${ARCH}" -o "$DEST/yq" && chmod +x "$DEST/yq"

# Install lf - a terminal file manager
ARG LFVER=26
RUN curl -fsSL "https://github.com/gokcehan/lf/releases/download/r${LFVER}/lf-linux-${ARCH}.tar.gz" | tar -C "$DEST" -xzf - lf

# Install gitui - a git TUI
ARG GITUIVER=0.19.0
RUN curl -fsSL "https://github.com/extrawurst/gitui/releases/download/v${GITUIVER}/gitui-linux-musl.tar.gz" | tar -C "$DEST" -xzf -

# Install shfmt - shell script formatter
ARG SHFMTVER=3.4.1
RUN curl -fsSL "https://github.com/mvdan/sh/releases/download/v${SHFMTVER}/shfmt_v${SHFMTVER}_linux_${ARCH}" -o "$DEST/shfmt" && chmod +x "$DEST/shfmt"

# Install Dockerfile linter hadolint
ARG HADOLINTVER=2.8.0
RUN curl -fsSL "https://github.com/hadolint/hadolint/releases/download/v${HADOLINTVER}/hadolint-Linux-x86_64" -o "$DEST/hadolint" && chmod +x "$DEST/hadolint"

# Install glow - terminal based Markdown rendering
ARG GLOWVER=1.4.1
RUN curl -fsSLO "https://github.com/charmbracelet/glow/releases/download/v${GLOWVER}/glow_${GLOWVER}_linux_${ARCH}.deb" && dpkg -i "./glow_${GLOWVER}_linux_${ARCH}.deb"

# Install exercism
ARG EXERCISMVER=3.1.0
RUN curl -fsSL "https://github.com/exercism/cli/releases/download/v${EXERCISMVER}/exercism-${EXERCISMVER}-linux-armv6.tar.gz" | tar -C "$DEST" -xzf - exercism

# Install bats
ARG BATSVER=1.8.2
RUN curl \
    --silent \
    --location \
    --url "https://github.com/bats-core/bats-core/archive/refs/tags/v$BATSVER.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory /tmp/ \
  && cd "/tmp/bats-core-$BATSVER" \
  && ./install.sh "$(dirname "$DEST")" 

# Clean up temp dir
RUN rm -rf /tmp/*

# Set up non-root user
ARG USERNAME=user
ARG UID=1000
RUN adduser \
  --uid $UID \
  --quiet \
  --disabled-password \
  --shell /bin/bash \
  --home /home/$USERNAME \
  --gecos "Dev User" \
  $USERNAME \
 && chown $USERNAME:$USERNAME /tmp/

USER $USERNAME
WORKDIR /home/$USERNAME
ENV TERM xterm-256color

# Set up dotfiles
RUN git clone https://github.com/qmacro/dotfiles.git && cd dotfiles/ && ./dotsetup

# Set focus reminder
RUN echo "What are you focusing on?" | tee "$HOME/.status" > "$HOME/.focus"

# Install Packer for NeoVim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Off we go - based on tmux, the terminal multiplexer
CMD ["tmux", "-u", "new", "-s", "main"]
