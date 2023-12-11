# Utiliza la imagen oficial de code-server como base
FROM codercom/code-server:latest

# Establece la contraseña para code-server
ENV PASSWORD="ML!gsx90l02"

# Instalar Node.js (usando Node.js 16)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Copia el proyecto al contenedor
COPY . /home/coder/project

# Cambia la propiedad del directorio del proyecto
RUN sudo chown -R coder:coder /home/coder/project

# Exponer el puerto de code-server
EXPOSE 8080


