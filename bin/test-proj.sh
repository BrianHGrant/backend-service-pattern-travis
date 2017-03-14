
#! /bin/bash

# PURPOSE: used to test that the DRF app is running inside the Docker container
# Can be used in Travis build or on local developer machine

echo Running test_proj.sh...

# docker-compose run --entrypoint="python manage.py test"  homeless-service

echo Build the service...
docker-compose homeless-service build .
echo Service Built...

echo Listing Docker Containers...

docker images -a

echo Start the Docker Container...

docker-compose start brianhgrant/homeless-service

echo Container started

docker-compose exec homeless-service python manage.py test
