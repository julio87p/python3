RUN apt-get update && apt-get install -y openssh-server sudo
RUN mkdir /var/run/sshd
RUN sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config
