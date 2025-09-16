# Use the official latest Alpine Linux image
FROM alpine:latest

# Install the necessary packages and btop
RUN apk update && \
    apk add --no-cache bash curl git build-base ncurses-dev

# clone btop repo and build
RUN git clone https://github.com/aristocratos/btop.git /opt/btop && \
    cd /opt/btop && \
    echo "in btop dir" && \
    make && \
    echo "make worked" && \
    make install

# Clean up space
RUN apk del git build-base ncurses-dev && \
    rm -rf /var/cache/apk/* /opt/btop

# set the command to run btop
CMD ["btop"]
