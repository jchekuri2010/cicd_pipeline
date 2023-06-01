#Docker build command:
docker build -t intuitive-cloud-docker-image .
#  List docker images
docker images
# Docker container 
docker run -d -i -p 8081:8080 intuitive-cloud-docker-image
#list running containers
docker ps -a
