# Dockerfile para Nginx con certificados SSL
FROM nginx:latest

# Copia los certificados SSL y la configuración de Nginx al contenedor
COPY /etc/letsencrypt/live/code.datqbox.com/fullchain.pem /etc/ssl/certs/
COPY /etc/letsencrypt/live/code.datqbox.com/privkey.pem /etc/ssl/private/
COPY ./conf.d/ /etc/nginx/conf.d/

# Asegúrate de que los permisos son correctos
RUN chmod 644 /etc/ssl/certs/fullchain.pem \
    && chmod 600 /etc/ssl/private/privkey.pem

