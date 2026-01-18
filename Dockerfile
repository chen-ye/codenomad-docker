FROM node:20-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3 /usr/bin/python

# Install OpenCode CLI and CodeNomad globally
RUN npm install -g opencode-ai @neuralnomads/codenomad

WORKDIR /workspace

# Expose CodeNomad Server port
EXPOSE 9898

# Environment variables for CodeNomad
ENV HOST=0.0.0.0
ENV PORT=9898

# Start CodeNomad server
# --no-launch prevents it from trying to open a local browser inside the container
CMD ["codenomad", "--host", "0.0.0.0", "--port", "9898", "--no-launch"]