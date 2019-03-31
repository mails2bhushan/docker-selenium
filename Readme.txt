This is a simple project. Purpose of having it to learn docker

First clone the project

install docker 

Pull below images{
 jenkins/jenkins:lts
 maven:3-alpine
 openjdk 8u191-jre-alpine3.8
 }
 
 Create separate jenkins folder and go to the folder -> open command or terminal
 enter, docker run -p 8080:8080 -p 50000:50000 -v "/Users/apple/jenkins:/var/jenkins_home" jenkins/jenkins:lts
 Now create a separate folder for slave