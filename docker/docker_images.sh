docker volume create jenkinsVol;

#docker pull jenkins/jenkins:lts;
docker pull jenkins/jenkins;

#docker run -d -p 9090:8080 -p 50000:50000 jenkins/jenkins;
#docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts;
docker run -d \
	-p 9500:8080  \
	-p 50000:50000  \
	--name jenkins \
	--mount source=jenkinsVol,target=/app \
	jenkins/jenkins;

#docker exec -it jenkins bash
#cat /var/jenkins_home/secrets/initialAdminPassword
#docker start jenkins
#docker stop jenkins

#docker pull mongo;
#docker run --name mongo-db mongo;
#docker run -d -p 27017:27017 --name mongo-db mongo;

#init bash mongo
#docker exec -it mongo-db bash


docker volume create dynamodbVol;

docker pull amazon/dynamodb-local;
#docker run -p 9000:8000 amazon/dynamodb-local;
docker run -d \
	-p 9501:8000  \
	--name dynamodb \
	--mount source=dynamodbVol,target=/app \
	amazon/dynamodb-local;

#http:localhost:9501/shell

docker pull sonarqube;

docker run -d --name sonarqube -p 9502:9000 sonarqube;


docker pull analogic/poste.io;

docker run -d \
    -p 25:25 \
    -p 80:80 \
    -p 110:110 \
    -p 143:143 \
    -p 443:443 \
    -p 587:587 \
    -p 993:993 \
    -p 995:995 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /your-data-dir/data:/data \
    --name "mailserver" \
    -h "mail.example.com" \
    -t analogic/poste.io;
