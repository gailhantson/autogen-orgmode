# Use an official lightweight Linux base image
FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y \
    emacs-nox \
    python3 \
    python3-pip \
    git \
    openssh-server \
    supervisor \
    curl

# Install AutoGen and Flask (for the backend API)
RUN pip3 install autogen flask

# Create a non-root user for security
RUN useradd -m -s /bin/bash emacsuser

# Set working directory
WORKDIR /home/emacsuser

# Copy project files into the container
COPY ../emacs/autogen-chat.el /home/emacsuser/autogen-chat.el
COPY ../backend/autogen_server.py /home/emacsuser/autogen_server.py
COPY ../config/settings.yaml /home/emacsuser/settings.yaml

# Set permissions
RUN chown -R emacsuser:emacsuser /home/emacsuser

# Enable SSH and Emacs daemon
RUN mkdir /var/run/sshd
RUN echo 'emacsuser:password' | chpasswd  # Change password as needed

# Start Emacs in daemon mode and enable SSH
CMD ["/usr/sbin/sshd", "-D"] & emacs --daemon

