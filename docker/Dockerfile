FROM ubuntu:12.04
MAINTAINER Jimmy Masias "jimmy.ilws@gmail.com"

# necessary to find the puredata package
RUN apt-get update 

# puredata packages
RUN apt-get install -y puredata puredata-utils

# in case you are used to vim editor
RUN apt-get install -y vim
# we need the "pdsend" in the vim settings
COPY ./vimrc /root/.vimrc

#EOF
