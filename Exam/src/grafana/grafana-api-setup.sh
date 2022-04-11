
echo "* Sleep for connection... 1m"
sleep 1m

echo "Create User"
curl -XPOST -H "Content-Type: application/json" -d '{
  "name":"User",
  "email":"user@graf.com",
  "login":"user",
  "password":"password"
}' http://admin:admin@192.168.111.203:3000/api/admin/users

echo "Data Source"
curl -XPOST -H "Content-Type: application/json" -d '{
  "name":"test_",
  "type":"prometheus",
  "url":"http://192.168.111.203:9090",
  "access":"proxy",
  "basicAuth":false
}' http://admin:admin@192.168.111.203:3000/api/datasources