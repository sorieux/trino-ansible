FROM almalinux:9.2

# Update the package lists and install openssh and sudo
RUN dnf -y update && dnf install -y openssh-server openssh-clients sudo

# Generate host keys for sshd
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key

# NOTE: Using a root password, is not recommended for production
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Démarrer SSH
CMD ["/usr/sbin/sshd", "-D"]