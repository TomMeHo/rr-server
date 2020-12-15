FROM ubuntu:latest

RUN apt-get install wget
#RUN apt-get install unzip 

RUN wget https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-1191-Ubuntu1804-AMD64.zip

RUN mkdir /rocrail-app
RUN unzip -*.zip -d /rocrail-app
RUN rm *.zip

VOLUME /rocrail-data

ENTRYPOINT ["/rocrail-app/bin/rocrail"]
CMD ["-w /rocrail-data"]
