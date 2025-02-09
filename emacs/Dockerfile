FROM ubuntu:22.04

# 1. Install Emacs, SSH (optional), etc.
RUN apt-get update && apt-get install -y \
    emacs-nox openssh-server git python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 2. Create a non-root user
RUN useradd -ms /bin/bash argosy
USER argosy
WORKDIR /home/argosy

# 3. Copy in Emacs config
COPY init.el /home/argosy/.emacs.d/init.el

# 4. Configure SSH (optional)
#    Make .ssh folder, set permissions (skip if you won't use SSH)
RUN mkdir -p /home/argosy/.ssh && chmod 700 /home/argosy/.ssh

# 5. Expose SSH port if needed
EXPOSE 22

# 6. Start SSH & Emacs daemon
#    If you don't need SSH, remove "service ssh start"
CMD /usr/sbin/sshd && emacs --daemon --chdir /home/argosy
