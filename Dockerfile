#gradle-image
FROM gradle:6.6.1-jdk11 AS build

ARG GRADLE_SRC=/home/gradle/src

COPY --chown=gradle:gradle ./ ${GRADLE_SRC}

WORKDIR ${GRADLE_SRC}

RUN gradle build --no-daemon


#app-image
FROM openjdk:11

MAINTAINER Mariia Slobodian

ARG JAR_FILE=build/libs/*.jar

WORKDIR ./app

COPY --from=build /home/gradle/src/${JAR_FILE} ./animal-service.jar

ENTRYPOINT ["java", "--enable-preview", "-jar", "./animal-service.jar"]