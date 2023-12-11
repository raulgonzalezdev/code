# Utiliza la imagen oficial de code-server como base
FROM codercom/code-server:latest

# Establece la contraseña para code-server
ENV PASSWORD="ML!gsx90l02"

# Instalar Node.js (usando Node.js 16)

RUN  apt-get update
RUN  apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

ENV NODE_MAJOR=20
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update
RUN apt-get install nodejs -y

# Copia el proyecto al contenedor
COPY . /home/coder/project

# Cambia la propiedad del directorio del proyecto
RUN sudo chown -R coder:coder /home/coder/project

# Exponer el puerto de code-server
EXPOSE 8080


