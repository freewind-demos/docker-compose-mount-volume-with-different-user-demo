FROM ubuntu:18.04

RUN mkdir /data
RUN mkdir /data/xxx

RUN useradd -ms /bin/bash freewind

#VOLUME /data

CMD ["sh", "-c", "whoami && ls -al /data"]
