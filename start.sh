docker-compose up -d
while true;
do
  response=$(curl -o /dev/null -s -w "%{http_code}\n" localhost:8080)
  if [ $response -eq "200" ]
  then
    echo "camunda is ready."
    exit 0
  else
    echo "Please wait.. camunda is initializing.."
    sleep 2
  fi
done
