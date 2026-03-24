# Imagen base (puedes usar ubuntu o debian)
FROM ubuntu:22.04

# Instalar dependencias para SSH y Docker
RUN apt-get update && apt-get install -y \
    openssh-server \
    curl \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Configurar SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password_temporal' | chpasswd
# Permitir login de root (ajusta según seguridad)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Script para instalar Docker dentro de la VM de Fly
RUN curl -fsSL https://get.docker.com -o install_docker.sh && sh install_docker.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
