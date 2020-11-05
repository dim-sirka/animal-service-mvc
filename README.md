# animal-service
Web-app for the animal shelter "Dim Sirka".

## Project status
[![Build Status](https://travis-ci.com/dim-sirka/animal-service.svg?branch=main)](https://travis-ci.com/dim-sirka/animal-service)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=dim-sirka_animal-service&metric=vulnerabilities)](https://sonarcloud.io/dashboard?id=dim-sirka_animal-service)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=dim-sirka_animal-service&metric=security_rating)](https://sonarcloud.io/dashboard?id=dim-sirka_animal-service)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=dim-sirka_animal-service&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=dim-sirka_animal-service)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=dim-sirka_animal-service&metric=ncloc)](https://sonarcloud.io/dashboard?id=dim-sirka_animal-service)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=dim-sirka_animal-service&metric=bugs)](https://sonarcloud.io/dashboard?id=dim-sirka_animal-service)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=dim-sirka_animal-service&metric=coverage)](https://sonarcloud.io/dashboard?id=dim-sirka_animal-service)
## Requirements
* Java 11
* Docker

## Building Instructions
(If running from windows - replace / to \ )
 * ./gradlew clean build -- build the project and run the tests

## Launch Instructions 
 - terminal:
 * java -jar build/libs/*.jar -- run the project
 - docker:
 * docker build -t animal-service . - build the docker image with name animal-service
 * docker run --name animal-service-container -p 8070:8080 -d animal-service - run container with name animal-service-container based on the animal-service image
 (make calls to port: `8070`)
 
## Running DB Instructions
 * create and run animal_db container locally
 ```
 docker run --name animal-db-container \
                 -e POSTGRES_PASSWORD=postgres \
                 -e POSTGRES_USERNAME=postgres \
                 -e POSTGRES_DB=animal_db \
                 -p 5433:5432 \
                 -d postgres 
 ```

## Running multi-container Instructions
* docker-compose up -- run animal-service app and animal-db containers
* docker-compose down -- stop animal-service app and animal-db containers
