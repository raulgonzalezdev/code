# Utiliza la imagen oficial de code-server como base
FROM codercom/code-server:latest

# Establece la contraseña para code-server
ENV PASSWORD="ML!gsx90l02"

# Copia el proyecto al contenedor
COPY ./code /home/coder/project

# Cambia la propiedad del directorio del proyecto
RUN sudo chown -R coder:coder /home/coder/project

# Exponer el puerto de code-server
EXPOSE 8080

