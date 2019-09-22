docker pull mysql/mysql-server:latest;

docker run --name=mysql01 -d mysql/mysql-server:latest;

docker logs mysql01;

#docker exec -it mysql01 mysql -uroot -p

#ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpassword';

