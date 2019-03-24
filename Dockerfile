FROM openjdk:8u191-jre-alpine3.8

#Installing curl and jq below for grid healthcheck purpose
RUN apk add curl jq
#create user work space to store the files
WORKDIR /usr/share/udemy

#add all required jars, jsons, csv`s and required files one by one
#volume mapping will happen below
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/libs							libs

#add suites files
ADD book-flight-module.xml				book-flight-module.xml
ADD search-module.xml					search-module.xml

#In healthcheck we are adding curl and jq to check the grid status whether it is up n running
ADD healthcheck.sh 						healthcheck.sh

#parameter should be passed
#browsername
#hostname
#xml file to run

#Below was the original entrypoint
#ENTRYPOINT java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* -DBROWSER=$BROWSER -DHUB_HOST=$HUB_HOST org.testng.TestNG $MODULE

ENTRYPOINT sh healthcheck.sh