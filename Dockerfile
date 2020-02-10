FROM ubuntu:18.04

RUN useradd -ms /bin/bash freewind

#RUN whoami

#RUN mkdir /data
VOLUME /data

RUN chown -R freewind:freewind /data

CMD ["sh", "-c", "ls -al /data"]
