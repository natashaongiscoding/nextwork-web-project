#!/bin/bash
sudo yum install tomcat -y
sudo yum -y install httpd
echo "Removing existing WAR file if it exists..."
sudo rm -f /usr/share/tomcat/webapps/nextwork-web-project.war
echo "Deploying new WAR file..."
sudo cat < EOF > /etc/httpd/conf.d/tomcat_manager.conf
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.nextwork.com
  DefaultType text/html
  ProxyRequests off
  ProxyPreserveHost On
  ProxyPass / http://localhost:8080/nextwork-web-project/
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF
