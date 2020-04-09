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

docker network connect nozomi-net jenkins

#docker network inspect jenkins
