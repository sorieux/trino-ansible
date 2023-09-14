# Utilisez l'image Trino comme base
FROM trinodb/trino:422

# Passage temporaire en utilisateur root pour installer les paquets
USER root

# Mettez à jour les packages et installez le serveur SSH
RUN apt-get update && apt-get install -y openssh-server git rsync openjdk-17-jdk

# Créez le répertoire nécessaire pour SSHD
RUN mkdir /var/run/sshd

# Configurez SSH pour permettre les connexions root (si nécessaire)
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# Créez un répertoire .ssh pour l'utilisateur root
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Copiez la clé publique dans l'image
COPY ssh-keys/id_rsa.pub /root/.ssh/authorized_keys

# Ajustez les permissions pour le répertoire .ssh et le fichier authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Exposez le port SSH
EXPOSE 22

# Commande pour démarrer SSHD en arrière-plan lors du lancement du conteneur
CMD ["/usr/sbin/sshd", "-D"]
