FROM debian:11 as base
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add Docker as source for apt
RUN apt-get update && apt-get install -y curl gpg lsb-release \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Add Cloud Foundry (CLI) as source for apt
RUN curl -fsSL "https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key" | apt-key add - \
  && echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list

RUN apt-get update \
 && apt-get install -y \
    apt-transport-https \
    asciinema \
    bash-completion \
    bc \
    build-essential \
    ca-certificates \
    cf7-cli \
    cron \
    curl \
    delta \
    docker-ce-cli \
    entr \
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
    newsboat \
    openssh-server \
    pandoc \
    pass \
    postgresql \
    shellcheck \
    sudo \
    uuid-runtime \
    vim-nox \
    w3m \
    wamerican-small \
    wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/
ARG DEST=/usr/local/bin

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
  fx \
  docsify-cli \
  bash-language-server \
  eslint \
  http-server \
  httpie \
  jwt-cli \
  lorem-ipsum \
  prettier \
  lodash \
  ramda \
  url-decode-encode-cli \
  yarn \
  yo

# Install bat - cat with wings
ARG BATVER=0.18.3
RUN curl -fsSLO "https://github.com/sharkdp/bat/releases/download/v$BATVER/bat-musl_${BATVER}_amd64.deb" && dpkg -i "./bat-musl_${BATVER}_amd64.deb"

# Install glow - terminal based Markdown rendering
ARG GLOWVER=1.4.1
RUN curl -fsSLO "https://github.com/charmbracelet/glow/releases/download/v${GLOWVER}/glow_${GLOWVER}_linux_amd64.deb" && dpkg -i "./glow_${GLOWVER}_linux_amd64.deb"

# Install gh - CLI for GitHub
ARG GHVER=2.14.3
RUN curl -fsSLO "https://github.com/cli/cli/releases/download/v${GHVER}/gh_${GHVER}_linux_amd64.deb" && dpkg -i "./gh_${GHVER}_linux_amd64.deb"

# Install yq - YAML query tool
ARG YQVER=4.16.1
RUN curl -fsSL "https://github.com/mikefarah/yq/releases/download/v${YQVER}/yq_linux_amd64" -o "$DEST/yq" && chmod +x "$DEST/yq"

# Install lf - a terminal file manager
ARG LFVER=26
RUN curl -fsSL "https://github.com/gokcehan/lf/releases/download/r${LFVER}/lf-linux-amd64.tar.gz" | tar -C "$DEST" -xzf - lf

# Install gitui - a git TUI
ARG GITUIVER=0.19.0
RUN curl -fsSL "https://github.com/extrawurst/gitui/releases/download/v${GITUIVER}/gitui-linux-musl.tar.gz" | tar -C "$DEST" -xzf -

# Install shfmt - shell script formatter
ARG SHFMTVER=3.4.1
RUN curl -fsSL "https://github.com/mvdan/sh/releases/download/v${SHFMTVER}/shfmt_v${SHFMTVER}_linux_amd64" -o "$DEST/shfmt" && chmod +x "$DEST/shfmt"

# Install kubectl - Kubernetes CLI
RUN curl -fsSL "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o "$DEST/kubectl" && chmod +x "$DEST/kubectl"

# Install Dockerfile linter hadolint
ARG HADOLINTVER=2.8.0
RUN curl -fsSL "https://github.com/hadolint/hadolint/releases/download/v${HADOLINTVER}/hadolint-Linux-x86_64" -o "$DEST/hadolint" && chmod +x "$DEST/hadolint"

# Install Steampipe - SQL for APIs
RUN /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/turbot/steampipe/main/install.sh)"

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Clean up temp dir
RUN rm -rf /tmp/*

# Set up non-root user
ARG USERNAME=user
ARG UID=1031
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

# Install Vim plugins
RUN vim +'PlugInstall --sync' +qa > /dev/null 2>&1

# Set focus reminder
RUN echo "What are you focusing on?" | tee "$HOME/.status" > "$HOME/.focus"

# Install btp CLI
RUN cd /tmp/ \
  && curl \
  --remote-name \
  --location \
  --url "https://raw.githubusercontent.com/SAP-samples/sap-tech-bytes/2021-09-01-btp-cli/getbtpcli" \
  && chmod +x getbtpcli \
  && echo -ne '\n' | ./getbtpcli

# Install ijq
ARG IJQVER=0.4.0
RUN curl \
    --silent \
    --location \
    --url "https://git.sr.ht/~gpanders/ijq/refs/download/v$IJQVER/ijq-$IJQVER-linux-x86_64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory /home/$USERNAME/bin/ \
      --strip-components 1 \
      --wildcards \
      ijq-$IJQVER/ijq

# Install Service Manager CLI tool
ARG SMCTLVER=1.11.12
RUN curl \
    --silent \
    --location \
    --url "https://github.com/Peripli/service-manager-cli/releases/download/v$SMCTLVER/smctl-v$SMCTLVER-linux-amd64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory /home/$USERNAME/bin/ \
      smctl

# Install Exercism
ARG EXERCISMVER=3.0.13
RUN curl \
    --silent \
    --location \
    --url "https://github.com/exercism/cli/releases/download/v$EXERCISMVER/exercism-$EXERCISMVER-linux-x86_64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory /home/$USERNAME/bin/ \
      exercism

# Install bats
ARG BATSVER=1.7.0
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
  && ./install.sh "$HOME"

# Install slides (presentations in terminal)
ARG SLIDESVER=0.7.3
RUN curl \
    --silent \
    --location \
    --url "https://github.com/maaslalani/slides/releases/download/v$SLIDESVER/slides_${SLIDESVER}_linux_amd64.tar.gz" \
    | tar \
      --extract \
      --gunzip \
      --file - \
      --directory /home/$USERNAME/bin/ \
      slides

# Off we go - based on tmux, the terminal multiplexer
CMD ["tmux", "-u", "new", "-s", "main"]
