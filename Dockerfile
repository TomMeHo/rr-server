FROM ubuntu:latest

VOLUME  /rocrail-data
RUN     mkdir /rocrail-app

RUN apt-get update \
	&& apt-get install -y \
		wget  \
		unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-1191-Ubuntu1804-AMD64.zip \
    && unzip *.zip -d /rocrail-app \
    && rm *.zip

RUN cd /rocrail-app/web \
    && unzip userthemes.zip \
    && rm *.zip

#Ports
## Rocweb
EXPOSE 8088/tcp
## http Service
EXPOSE 53701/tcp 
## Rocview Clients
EXPOSE 8051/tcp

CMD rocrail-app/bin/rocrail -w /rocrail-data -i /rocrail-data/rocrail.ini -l /rocrail-app/bin -t /rocrail-data/trace/trace -img /rocrail-data/img
