FROM python:3.11-slim

# Install any system packages needed
RUN apt-get update && apt-get install -y \
    curl && rm -rf /var/lib/apt/lists/*

# Install Python dependencies (websockets, Autogen, etc.)
RUN pip install --no-cache-dir websockets autogen

# Create a user (optional)
RUN useradd -ms /bin/bash argosy
USER argosy
WORKDIR /home/argosy

# Copy in the code
COPY main.py /home/argosy/

EXPOSE 8000
CMD ["python", "main.py"]
