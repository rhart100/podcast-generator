# Use a python
FROM python:3.10-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN pip install PyYAML


# Now, any subsequent RUN, CMD, or ENTRYPOINT commands will use the Python and pip from the virtual environment.

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


