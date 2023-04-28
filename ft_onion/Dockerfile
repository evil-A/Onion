FROM nginx:stable

#Install
RUN apt update
RUN apt install -y tor ssh
RUN apt install -y vim

#SSH Config
RUN rm /etc/ssh/sshd_config
COPY /srcs/sshd_config /etc/ssh/
RUN adduser evilonion; echo 'evilonion:onionevil' || chpasswd
COPY /srcs/authorized_keys /.ssh/authorized_keys
RUN mkdir /home/evilonion/.ssh
WORKDIR /home/evilonion
COPY /srcs/authorized_keys .ssh/authorized_keys

RUN chown -R evilonion:evilonion .ssh/
WORKDIR /home/evilonion/.ssh
RUN chmod 600 authorized_keys

#WEB
COPY /srcs/index.html /usr/share/nginx/html/

#TOR
COPY /srcs/torrc /etc/tor/

#Externo
###ssh evilonion@localhost -p 4242
### vim ~/.ssh/known_hosts
### cat /var/lib/tor/hidden_service/hostname
#CMD

EXPOSE 80:80 4242:4242 

#INIT
CMD service nginx start && service ssh start && service tor start && bash


#ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINVocBwOWla48qdz5SxfL0Vb5gJsRTn+O5d3Rc1DLuvn evila-ro@student.42madrid.com
#docker build [name] .
#docker images
# docker run -it [name]
#docker run -it -p 80:80 [name]
#docker system prune -a
#docker ps
#docker exec -it nervous_shannon /bin/bash

#• El servicio deberá contar con una página web estática: un solo archivo index.html. La página será accesible a través de una url del tipo xxxxxxxxx.onion. El contenido de la página es up to you.
#• Se utilizará Nginx para configurar el servidor web. No se permite ningún otro ser- vidor o framework.
#• Se podrá acceder a la página web por HTTP en el puerto 80.
#• Deberá estar habilitado el acceso al servidor por SSH en el puerto 4242.
#• No deberás abrir ningún puerto ni establecer reglas de firewall.

#evilonion:onionevil

