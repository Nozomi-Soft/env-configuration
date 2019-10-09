docker pull sonarqube

mkdir -p $HOME/docker/volumes/sonarqube/logs;

#docker run -d --name sonarqube \
#    -p 9502:9000 \
#    -e sonar.jdbc.username=sonar \
#    -e sonar.jdbc.password=sonar \
#    -e sonar.jdbc.url="jdbc:mysql://localhost:9501/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true&useSSL=false" \
#    -v $HOME/docker/volumes/sonarqube/logs:/opt/sonarqube/logs \
#    sonarqube

docker run -d --name sonarqube \
	-p 9502:9000 \
	-v $HOME/docker/volumes/sonarqube/logs:/opt/sonarqube/logs \
	sonarqube;
