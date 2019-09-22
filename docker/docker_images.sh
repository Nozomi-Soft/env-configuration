
docker pull mongo;
#docker run --name mongo-db mongo;
mkdir $HOME/mongo;
mkdir $HOME/mongo/datadir;

docker run -d \
	-p 27017:27017 \
	--name mongo-db \
	-v $HOME/mongo/datadir:/data/db \
	mongo;

#init bash mongo
#docker exec -it mongo-db bash
#on bash
#mongo 
#use nozomi
#db.createUser(
#  {
#    user: "user",
#    pwd: "pass",
#    roles: [ { role: "readWrite", db: "nozomi" },
#             { role: "read", db: "reporting" } ]
#  }
#)

#docker volume create dynamodbVol;

#docker pull amazon/dynamodb-local;
#docker run -p 9000:8000 amazon/dynamodb-local;
#docker run -d \
#	-p 9501:8000  \
#	--name dynamodb \
#	--mount source=dynamodbVol,target=/app \
#	amazon/dynamodb-local;

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
