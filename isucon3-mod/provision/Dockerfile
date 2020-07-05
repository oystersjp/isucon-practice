FROM amazonlinux:2

# Amazon Linux2 AMIとの乖離を埋める
RUN yum update -y && \
    yum install -y sudo make vim shadow-utils systemd openssh-clients openssh-server yum-utils
RUN systemctl enable sshd

# Itamae
RUN amazon-linux-extras install -y ruby2.4 && \
    yum install -y rubygem-rdoc && \
    gem install itamae

COPY test/authorized_keys /root/.ssh/authorized_keys
RUN chmod 0700 /root/.ssh && \
    chmod 0600 /root/.ssh/authorized_keys && \
    sed -i -e 's/#PermitRootLogin yes/PermitRootLogin without-password/' /etc/ssh/sshd_config
