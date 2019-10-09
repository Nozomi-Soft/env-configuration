docker pull mysql/mysql-server:latest;

#docker run --name=mysql-dev -d mysql/mysql-server:latest -p 3306:3306;
docker run -d -p 9501:3306 --name=mysql-dev --env="MYSQL_ROOT_PASSWORD=123456" mysql/mysql-server:latest;

docker logs mysql-dev;

#docker exec -it mysql-dev mysql -u root -p

#ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpassword';

#CREATE USER 'nozomi'@'%' IDENTIFIED BY 'pass';
#GRANT ALL PRIVILEGES ON *.* TO 'nozomi'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;

#CREATE DATABASE nozomidb;
#USE nozomidb;

#CREATE DATABASE sonar;
#CREATE USER 'sonar'@'%' IDENTIFIED BY 'sonar';
#GRANT ALL PRIVILEGES ON *.* TO 'sonar'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;

