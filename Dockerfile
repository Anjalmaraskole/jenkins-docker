FROM ubuntu:22.04

RUN apt-get update && apt-get install -y bash

WORKDIR /app

COPY ./app.sh ./          # Explicitly copy to WORKDIR

RUN chmod +x app.sh

CMD ["./app.sh"]
