FROM amazonlinux:2

RUN yum update -y && \
    yum install -y sudo make vim shadow-utils systemd

RUN amazon-linux-extras install -y ruby2.4 && \
    yum install -y rubygem-rdoc && \
    gem install itamae
