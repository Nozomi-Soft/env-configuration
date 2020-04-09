# Docker installation and configuration scripts

Docker installation and configuration

    sh docker_config.sh

> $USER env variable is use to add the current user to docker group.

The docker network "nozomi-net" was created.

# Creating Jenkins Container

    sh jenkins.sh

The script pull the jenkins image and and run the container.

- Volume: jenkinsVol
- Port: 9500

Also the jenkins container was added to docker network.

# Creating Postgres Container

    sh postgres.sh

The script pull the Postgres image and run the container.

- Volume: postgres_data
- Port: 9503

Also the container is added to docker network.

After the container start, open the file:

    sudo nano /var/lib/docker/volumes/postgres_data/_data/pg_hba.conf
And add the line:
 >   host all all all password

 # Creating Sonarqube Container
    sh sonarqube.sh
The script pull the Sonarqube image and run the container.

- Volume: sonarqube_data, sonarqube_extensions, sonarqube_logs
- Port: 9502

Also the container was added to docker network.
