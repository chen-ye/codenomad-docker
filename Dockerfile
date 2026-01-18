FROM node:lts-alpine

# Install system dependencies
# build-base: equivalent to build-essential for compiling native modules
RUN apk add --no-cache \
    git \
    python3 \
    py3-pip \
    curl \
    build-base \
    && ln -sf /usr/bin/python3 /usr/bin/python

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
CMD codenomad --host $HOST --port $PORT --no-launch
