sudo docker pull mysql/mysql-server:latest;

echo "Enter a container name (mysql-dev)";
read  CONTAINER_NAME;

echo "Enter a volume name (mysqlvolume)";
read  VOLUME_NAME;

echo "Enter a port number (9501)";
read  PORT_MYSQL;

sudo docker volume create $VOLUME_NAME;

#sudo docker run --name=mysql-dev -d mysql/mysql-server:latest -p 3306:3306;

sudo docker run -d -e MYSQL_ROOT_PASSWORD=123456 \
-p $PORT_MYSQL:3306 \
--name $CONTAINER_NAME \
--mount source=$VOLUME_NAME,target=/app \
mysql/mysql-server:latest;

sudo docker logs $CONTAINER_NAME;

echo "Enter a network name";
read NETWORK_NAME;

sudo docker network connect $NETWORK_NAME $CONTAINER_NAME

#sudo docker exec -it mysql-dev mysql -u root -p

#ALTER USER 'root'@'localhost' IDENTIFIED BY '<new_password>';

#CREATE USER '<user_name>'@'%' IDENTIFIED BY 'pass';
#GRANT ALL PRIVILEGES ON *.* TO '<user_name>'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;

#CREATE DATABASE <database_name>;
#USE <database_name>;
