FROM ubuntu
    
    MAINTAINER pivotadmin@precisionit.co.in
    
    RUN apt-get update && \
        apt-get install -y openjdk-8-jdk && \
        apt-get install -y ant && \
	      apt-get install -y net-tools && \
	      apt-get install -y inetutils-ping && \
	      apt-get install -y iputils-ping && \
	      apt-get install -y telnet && \
        apt-get install -y vim && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
        rm -rf /var/cache/oracle-jdk8-installer;
        
    ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
    RUN export JAVA_HOME
   
    RUN mkdir /properties
    ENV CONFIGDIR /properties/
    RUN export CONFIGDIR

    RUN mkdir /applogs
    ENV LOGDIR /applogs/
    RUN export LOGDIR
 
    RUN apt-get update && apt-get install -y \
    curl
    CMD /bin/bash
    
    RUN mkdir /opt/tomcat/
    
    WORKDIR /opt/tomcat
    RUN curl -O -L https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz
    RUN tar xvfz apache*.tar.gz
    RUN mv apache-tomcat-8.0.33/* /opt/tomcat/.
