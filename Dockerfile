FROM ubuntu:22.04

RUN apt-get update && apt-get install -y bash

WORKDIR /app

COPY app.sh .          # Current directory me copy karo

RUN chmod +x app.sh    # Make executable

CMD ["./app.sh"]
