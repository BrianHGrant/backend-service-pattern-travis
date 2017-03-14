
#! /bin/bash

# PURPOSE: used to test that the DRF app is running inside the Docker container
# Can be used in Travis build or on local developer machine

echo Running test_proj.sh...

# docker-compose run --entrypoint="python manage.py test"  homeless-service
#
# echo Build the service...
# docker-compose build
# echo Service Built...

echo Create the Docker Container
docker network create backendservicepatterntravis_homeless-service_1
docker-compose create homeless-service

echo Listing Docker Containers...

docker ps -a

echo Start the Docker Container...

docker-compose start homeless-service

echo Container started

docker-compose exec homeless-service python manage.py test
