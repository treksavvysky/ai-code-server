# Start from the base image you are already using
FROM codercom/code-server:latest

# Switch to the root user to install new software globally
USER root
#
# === Install Dependencies (using apt-get) ===
#
# The base image is Debian/Ubuntu-based, so we use 'apt-get'
# 1. Update package lists
# 2. Install nodejs and npm
# 3. Clean up apt cache to keep the image layer small
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*
#
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