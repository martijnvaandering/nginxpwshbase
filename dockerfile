FROM nginx:1.23.3

# Installeer Nginx en PowerShell Core
RUN apt-get update
RUN apt-get install -y wget lsb-release fcgiwrap
RUN wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y powershell

# Maak een map aan om PowerShell-scripts op te slaan
WORKDIR /scripts

# Kopieer een voorbeeld PowerShell-script naar de container
COPY example.ps1 /usr/share/nginx/html/example.ps1
#RUN chmod +X /usr/share/nginx/html/example.ps1 && chmod 777 /usr/share/nginx/html/example.ps1
COPY default.conf /etc/nginx/conf.d/default.conf
COPY init.sh /

# Exposeer poort 80 voor Nginx
EXPOSE 80

# Start fcgiwrap en Nginx, voer het PowerShell-script uit bij het starten van de container
CMD ["/init.sh"]
