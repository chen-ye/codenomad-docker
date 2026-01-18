FROM node:lts-alpine

# Install system dependencies
# build-base: equivalent to build-essential for compiling native modules
# gcompat: provides glibc compatibility for Alpine
RUN apk add --no-cache \
    git \
    python3 \
    py3-pip \
    curl \
    build-base \
    gcompat \
    && ln -sf /usr/bin/python3 /usr/bin/python

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