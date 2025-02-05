FROM --platform=linux/amd64 debian:12

WORKDIR /tmp/
ARG DEST=/usr/local/bin

RUN apt-get update \
  && apt-get install -y \
     apt-transport-https \
     build-essential \
     curl \
     git \
     libevent-dev \
     ncurses-dev \
     vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# tmux - terminal multiplexer
ARG TMUXVER=3.3a
RUN curl -fsSL "https://github.com/tmux/tmux/releases/download/$TMUXVER/tmux-$TMUXVER.tar.gz" \
  | tar -xzf - \
  && cd "tmux-$TMUXVER" && ./configure && make && make install

# Off we go
CMD ["bash"]
