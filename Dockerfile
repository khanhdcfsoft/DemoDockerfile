FROM ubuntu:16.04

ENV container docker

RUN mkdir /share;
VOLUME [ "/share" ]

RUN apt-get update
RUN apt-get -y install wget git-core python python-dev python-pip libmysqlclient-dev virtualenv


RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub |apt-key add
RUN apt-get update
RUN apt-get -y install salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api

RUN apt-get clean all

RUN pip install pip==9.0.3
RUN pip install virtualenvwrapper
RUN pip install tornado==4.2.1
RUN pip install enum34==1.1.3
RUN pip install pyasn1==0.4.1

ENV WORKON_HOME=$HOME/.virtualenvs
RUN echo "source /usr/local/bin/virtualenvwrapper.sh" >> /etc/bash.bashrc
