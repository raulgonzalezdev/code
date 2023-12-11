# Utiliza la imagen oficial de code-server como base
FROM codercom/code-server:latest

# Establece la contraseña para code-server
ENV PASSWORD="ML!gsx90l02"

# Asegúrate de que los comandos se ejecuten como root
USER root

# Instalar dependencias y Node.js
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Define la versión mayor de Node.js a instalar
ENV NODE_MAJOR=20

# Añade el repositorio de NodeSource y actualiza la lista de paquetes
RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Copia el proyecto al contenedor
COPY . /home/coder/project

# Cambia la propiedad del directorio del proyecto
RUN chown -R coder:coder /home/coder/project

# Exponer el puerto de code-server
EXPOSE 8080

# Cambia de nuevo al usuario original (si es necesario)
USER coder




