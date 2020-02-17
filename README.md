# geoblacklight-docker
Containerized version of geoblacklight

## Build 

docker build -t geoblacklight .  
docker run --name geoblacklight -d -p 3000:3000 -it geoblacklight

## Test
docker logs geoblacklight
