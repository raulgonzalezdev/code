# Utiliza la imagen oficial de code-server como base
FROM codercom/code-server:latest

# Establece las variables de entorno necesarias para code-server
ENV PASSWORD='ML!gsx90l02'  

# Copia tu repositorio clonado y archivos de configuración en el contenedor
# Suponiendo que tu repositorio está en la carpeta /var/www/webapp/code en tu host
COPY ./code /home/coder/project

# Ajusta los permisos para el directorio del proyecto
RUN sudo chown -R coder:coder /home/coder/project

# Exponer los puertos necesarios
EXPOSE 8080

# El punto de entrada y comando por defecto se heredarán de la imagen base
