# Use a base Ubuntu image
FROM ubuntu:latest

# Install python3-pip, python3-venv, and git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3.10 -m venv /opt/venv

# Activate the virtual environment and install PyYAML
# The '&&' links the commands so they run in the same shell session.
RUN /opt/venv/bin/pip install PyYAML

# Set the virtual environment as the default Python for subsequent commands
ENV PATH="/opt/venv/bin:$PATH"

# Now, any subsequent RUN, CMD, or ENTRYPOINT commands will use the Python and pip from the virtual environment.

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

