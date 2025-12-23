FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
        cowsay \
        fortune-mod \
        python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]
