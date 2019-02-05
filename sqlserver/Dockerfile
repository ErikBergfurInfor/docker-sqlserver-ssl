FROM microsoft/mssql-server-linux

RUN apt-get -y update && apt-get -y install \
  net-tools \
  netcat \
&& apt-get clean


# SSL setup from https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-encrypted-connections

# To add this to cacerts, in a BCFKS environment
# openssl x509 -outform der -in /grid/sqlserver/mssql.pem -out /tmp/mssql.der
# keytool -noprompt -storepass changeit -import -alias sqlserver -keystore /usr/java/latest/jre/lib/security/cacerts -file /tmp/mssql.der

COPY mssql.pem /etc/ssl/certs
COPY mssql.key /etc/ssl/private

RUN /opt/mssql/bin/mssql-conf set network.tlscert /etc/ssl/certs/mssql.pem
RUN /opt/mssql/bin/mssql-conf set network.tlskey /etc/ssl/private/mssql.key
RUN /opt/mssql/bin/mssql-conf set network.tlsprotocols 1.2
RUN /opt/mssql/bin/mssql-conf set network.forceencryption 1

COPY *.sh /
RUN chmod +x /*.sh
COPY *.sql /

CMD ["/entrypoint.sh"]
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=DefaultPassword123
