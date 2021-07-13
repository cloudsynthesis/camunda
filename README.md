# Camunda deployment

This document provides detailed information about deployment of camunda using docker-compose.

## Requirements

| Name | Version |
|------|---------|
| docker | ">= 18" |
| docker-compose | ">= 1.26" |

## Usage

```buildoutcfg
Create a .env file with following contents inside camunda directory

DB_DRIVER=com.mysql.cj.jdbc.Driver
DB_URL=jdbc:mysql://mysql:3306/processengine?sendFractionalSeconds=false
DB_USERNAME=<username>
DB_PASSWORD=<password>
WAIT_FOR=mysql:3306
MYSQL_ROOT_PASSWORD=<root-password>
MYSQL_USER=<username>
MYSQL_PASSWORD=<password>
MYSQL_DATABASE=processengine
```

### Using from Linux Machine
```buildoutcfg
Execute start.sh shell script if you are executing it from linux machine
The script will let you know once camunda applicaiton is ready to use.
The script will create 2 containers.
    1. camunda application
    2. mysql database with persistent storage
./start.sh

To check Logs execute logs.sh
./logs.sh

To delete complete stack run stop.sh. This will delete all containers and networks.
Data will still be persisted in the volume.
./stop.sh
```

### Using from Windows Machine
```buildoutcfg
To start the application run following command. 
docker-compose up -d

To check Logs execute following command.
docker-compose logs -f

To delete complete stack run following command. This will delete all containers and networks.
Data will still be persisted in the volume.
docker-compose down
```

## Access the application
```buildoutcfg
Open your favourite web browser and hit following URL.

http://localhost:8080/camunda
Username: demo
Password: demo
```

## Test durability of data
```buildoutcfg
Once your application is up and running, the follow the following process.
1. Login to Application using above credentials.
2. Click on Admin.
3. On the left hand user tab click on create new user.
4. Type all the required details and click on create new user.
5. Logout from application.
6. Run ./stop.sh or docker-compose down to delete the stack
7. check whether persistent volume still exists using following command
   # docker volume ls 
   There should be a volume named camunda-data.
8. Start the applicationa again with ./start.sh or docker-compose up -d
9. Login to application
10. Click on Admin.
11. Click on List of Users
12. Check whether the user you created still exists.
```
