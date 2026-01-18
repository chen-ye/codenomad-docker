FROM node:20-slim

# Install system dependencies
# git: for cloning/git operations
# python3/pip: common requirement for AI agents/tools
# curl: for healthchecks/downloads
# build-essential: for compiling native node modules
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3 /usr/bin/python

# Install OpenCode CLI and CodeNomad globally
# --unsafe-perm=true is required for post-install scripts
RUN npm install -g opencode-ai @neuralnomads/codenomad --unsafe-perm=true

WORKDIR /workspace

# Expose CodeNomad Server port
EXPOSE 9898

# Environment variables for CodeNomad
ENV HOST=0.0.0.0
ENV PORT=9898

# Start CodeNomad server
# Launching is disabled by default
CMD codenomad --host $HOST --port $PORT