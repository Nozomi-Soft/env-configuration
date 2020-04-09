docker pull postgres

docker volume create --name postgres_data

docker run -i --rm postgres cat /usr/share/postgresql/postgresql.conf.sample > postgres.conf

echo "listen_addresses = '*'" >> postgres.conf

docker run -d \
--name postgres \
-p 9503:5432 \
-v "$PWD/postgres.conf":/etc/postgresql/postgresql.conf \
-v postgres_data:/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=sonar \
-e POSTGRES_USER=sonar \
-e POSTGRES_DB=sonar \
postgres \
-c 'config_file=/etc/postgresql/postgresql.conf'


docker network connect nozomi-net postgres


#docker exec -it postgres bash


#sudo nano /var/lib/docker/volumes/postgres_data/_data/pg_hba.conf
#host all all all password
