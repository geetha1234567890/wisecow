# Use a base image with a lightweight Linux distribution
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the application files to the working directory
COPY . .

# Install prerequisites and verify installation
RUN apt-get update && \
    apt-get install -y cowsay fortune netcat-openbsd && \
    ln -s /usr/games/cowsay /usr/local/bin/cowsay && \
    ln -s /usr/games/fortune /usr/local/bin/fortune && \
    echo "cowsay version:" && cowsay --version && \
    echo "fortune version:" && fortune -v && \
    echo "netcat version:" && nc -h

# Make the wisecow.sh script executable
RUN chmod +x /app/wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Start the application
CMD ["/app/wisecow.sh"]

