# geoblacklight-docker
Containerized version of geoblacklight

## Docker Build 

docker build -t geoblacklight .  \
docker run --name geoblacklight -d -p 3000:3000 -it geoblacklight

## Docker Logs
docker logs geoblacklight

## Docker Compose Build
docker-compose build \
docker-compose up

## Docker Compose Logs
docker compose logs geoblacklight \
docker-compose logs solr