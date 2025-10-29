# Start from the base image you are already using
FROM codercom/code-server:latest

# Switch to the root user to install new software globally
USER root
#
# === Install Dependencies (using apt-get) ===
# === Install Node.js 20 ===
# 1. Add the NodeSource repository for Node 20
# 2. Install Node.js (which includes npm)
# 3. Clean up apt cache
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*
#
RUN curl -L https://download.docker.com/linux/static/stable/x86_64/docker-27.3.1.tgz | tar -xz && mv docker/* /usr/local/bin/
# === Install CLIs using npm ===
#
# The base image already has Node.js and npm.

# 1. Install Google (Gemini) CLI
RUN npm install -g @google/gemini-cli@latest

# 2. Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

#
# === End of Installations ===
#

# Switch back to the default user for this image
USER coder