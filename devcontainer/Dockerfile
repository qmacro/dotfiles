FROM debian:latest
MAINTAINER "DJ Adams"
SHELL ["/bin/bash", "-c"]

# This is the user ID of my user on the Docker host - adjust to suit
ARG UID=1031

# This is a container user so I'm not working as root
ARG USERNAME=user

# The current latest version of various programs
ARG TMUXVER=3.2a
ARG YQVER=4.12.1
ARG NODEVER=lts
ARG GITUIVER=0.17

RUN apt-get update \
  && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    vim \
    jq \
    bat \
    ncat \
    entr \
    wget \
    curl \
    gnupg \
    pass \
    man \
    bash-completion \
    lsb-release \
    openssh-server \
    shellcheck \
    file \
    build-essential \
    sudo \
    fzf \
  && curl -fsSL https://download.docker.com/linux/debian/gpg \
     | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update \
  && apt-get install -y docker-ce-cli

# Install latest gh
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt-get update \
  && apt-get install -y gh

# Install latest yq
RUN wget https://github.com/mikefarah/yq/releases/download/v${YQVER}/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

# Install latest tmux
RUN apt-get install -y \
  ncurses-dev libevent-dev \
  && cd /tmp/ \
  && wget https://github.com/tmux/tmux/releases/download/$TMUXVER/tmux-$TMUXVER.tar.gz \
  && tar xzf tmux-$TMUXVER.tar.gz \
  && cd tmux-$TMUXVER \
  && ./configure && make && make install

# Install specific Node.js
RUN curl -fsSL "https://deb.nodesource.com/setup_$NODEVER.x" | bash - \
  && apt-get install -y nodejs

# Install cf CLI (v7)
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - \
  && echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list \
  && apt-get update \
  && apt-get install -y cf7-cli

# Install latest kubectl
RUN curl -L -o /usr/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
  && chmod +x /usr/bin/kubectl

RUN adduser \
  --uid $UID \
  --quiet \
  --disabled-password \
  --shell /bin/bash \
  --home /home/$USERNAME \
  --gecos "Dev User" \
  $USERNAME


# Install fff and then ensure that bin/ and share/ are user-owned
RUN cd /tmp \
  && git clone https://github.com/dylanaraps/fff \
  && cd fff \
  && PREFIX=/home/$USERNAME make install \
  && chown -R $USERNAME:$USERNAME /home/$USERNAME/bin /home/$USERNAME/share

# Install gitui
RUN cd /tmp \
  && wget "https://github.com/extrawurst/gitui/releases/download/v$GITUIVER/gitui-linux-musl.tar.gz" \
  && tar -x -z -C /usr/bin/ -f "./gitui-linux-musl.tar.gz"

# Change ownership of /tmp
RUN chown $USERNAME:$USERNAME /tmp/

USER $USERNAME
WORKDIR /home/$USERNAME
ENV TERM xterm-256color

# Set up dotfiles
RUN git clone https://github.com/qmacro/dotfiles.git .dotfiles \
  && cd .dotfiles \
  && ./dotsetup \
  && git remote set-url origin git@github.com:qmacro/dotfiles.git

# Install vim plugins
RUN vim +'PlugInstall --sync' +qa > /dev/null 2>&1

CMD ["bash"]
