#docker pull jenkins/jenkins:lts;
docker pull jenkins/jenkins;

docker run -d -p 9090:8080 -p 50000:50000 jenkins/jenkins;
#docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts;


docker pull mongo;
#docker run --name mongo-db mongo;
docker run -d -p 27017:27017 --name mongo-db mongo;

#init bash mongo
#docker exec -it mongo-db bash
