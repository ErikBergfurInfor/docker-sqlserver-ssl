mkdir -p /share/stage
rm -f /share/stage/database-started
while ! nc -z localhost 1433; do
  echo "Waiting for SQL Server";
  sleep 1
done
sleep 5
echo "Executing script..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P DefaultPassword123 -d master -i /createDatabase.sql
echo "Done"
touch /share/stage/database-started
