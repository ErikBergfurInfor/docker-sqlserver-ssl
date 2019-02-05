# docker-sqlserver-ssl
A SSL Enabled SQL Server
* Install docker from https://www.docker.com/get-started
* Run the SQL Server with: docker-compose up -d --build

# Add CA to cacerts:
* To add this to cacerts, in a BCFKS environment
* openssl x509 -outform der -in sqlserver/mssql.pem -out /tmp/mssql.der
* keytool -noprompt -storepass changeit -import -alias sqlserver -keystore /usr/java/latest/jre/lib/security/cacerts -file /tmp/mssql.der
