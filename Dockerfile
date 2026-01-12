FROM ubuntu:22.04

RUN apt-get update && apt-get install -y bash

# Make sure /app directory exists
RUN mkdir -p /app

WORKDIR /app

# Copy app.sh to /app directory
COPY app.sh /app/

RUN chmod +x /app/app.sh

CMD ["./app.sh"]
