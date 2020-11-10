FROM ubuntu
    
    MAINTAINER pivotadmin@precisionit.co.in
    
    
    RUN mkdir /properties
    ENV CONFIGDIR /properties/
    RUN export CONFIGDIR

    RUN mkdir /applogs
    ENV LOGDIR /applogs/
    RUN export LOGDIR
 
    
