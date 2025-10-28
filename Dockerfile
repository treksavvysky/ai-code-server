# Start from the base image you are already using
FROM linuxserver/code-server:latest

# Switch to the root user to install new software globally
USER root
#
# === Install Dependencies ===
#
# The linuxserver images are based on Alpine, so we use 'apk'
# This adds Node.js and npm to the image.
RUN apk add --no-cache nodejs npm
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

# Switch back to the default non-root user 'abc'
# This is the user 'code-server' runs as.
USER abc