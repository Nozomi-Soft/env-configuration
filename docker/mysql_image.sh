sudo docker pull mysql/mysql-server:latest;

sudo docker volume create mysqlvolume;

#sudo docker run --name=mysql-dev -d mysql/mysql-server:latest -p 3306:3306;

sudo docker run -d -e MYSQL_ROOT_PASSWORD=123456 \
-p 9501:3306 \
--name mysql-dev \
--mount source=mysqlvolume,target=/app \
mysql/mysql-server:latest;

sudo docker logs mysql-dev;

sudo docker network connect nozomi-net mysql-dev

#sudo docker exec -it mysql-dev mysql -u root -p

#ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpassword';

#CREATE USER 'nozomi'@'%' IDENTIFIED BY 'pass';
#GRANT ALL PRIVILEGES ON *.* TO 'nozomi'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;

#CREATE DATABASE nozomidb;
#USE nozomidb;
