FROM ubuntu:24.04

RUN apt update &&\
    apt install -y sudo wget git python3-neovim zip python3-pip python3-venv npm &&\
		apt clean all


# use basic ubuntu profile to match 1000 UID
USER ubuntu

ENV HOME=/home/ubuntu
ENV NVIM_BIN=/home/ubuntu/nvim-linux-x86_64/bin

# nvim setup
RUN cd /home/ubuntu/ && \
    wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz &&\
	  tar xzvf nvim-linux-x86_64.tar.gz

# setup my config
RUN mkdir -p /home/ubuntu/.config
RUN git clone https://github.com/Timur-ux/nvim-setup.git /home/ubuntu/.config/nvim

# setup packages, lsps, formatters, etc
RUN /home/ubuntu/nvim-linux-x86_64/bin/nvim --headless -c "MasonToolsInstallSync" -c qall

VOLUME [ "/app" ]

# restore root user for be able to install additional packages in applications
USER root

ENTRYPOINT [ "/home/ubuntu/nvim-linux-x86_64/bin/nvim", "/app" ]
