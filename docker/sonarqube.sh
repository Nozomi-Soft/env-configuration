docker pull sonarqube

docker volume create --name sonarqube_data
docker volume create --name sonarqube_extensions
docker volume create --name sonarqube_logs


docker run -d --name sonarqube \
-p 9502:9000 \
-e sonar.jdbc.username=sonar \
-e sonar.jdbc.password=sonar \
-e sonar.jdbc.url="jdbc:postgresql://postgres/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true&useSSL=false" \
-v sonarqube_data:/opt/sonarqube/data \
-v sonarqube_extensions:/opt/sonarqube/extensions \
-v sonarqube_logs:/opt/sonarqube/logs \
--network nozomi-net \
sonarqube
