#!/bin/bash
cd /home/container || exit 1

# Output current Java and FFmpeg versions for debugging
java -version
ffmpeg -version | head -n 1

# Convert Pterodactyl STARTUP command environment variable and execute it
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the command passed by the egg
eval "${MODIFIED_STARTUP}"