FROM ubuntu
MAINTAINER Anees anees284@gmail.com

RUN apt-get update
RUN apt-get upgrade -y
RUN apt install -y apt openjdk-8-jdk
RUN apt install -y maven
RUN mkdir -p /myapp
WORKDIR /myapp
ADD src /myapp/src
COPY pom.xml /myapp
RUN mvn package
RUN cd target
CMD java -jar target/app.jar


#RUN npm --version
#RUN npm install -y express express-fileupload body-parser mysql ejs req-flash
#CMD node app.js
