FROM debian:latest

# prereqs
RUN apt-get update && \
    apt-get install -y \
        git \
        puredata \
        vim

# actual code
RUN git clone https://github.com/gabochi/rampcode.git /opt/rampcode

WORKDIR /opt/rampcode

CMD ./rampcode.sh
