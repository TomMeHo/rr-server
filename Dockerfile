FROM ubuntu:latest

VOLUME  /rocrail-data
RUN     mkdir /rocrail-app

RUN apt-get update \
	&& apt-get install -y \
		wget  \
		unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-1191-Ubuntu1804-AMD64.zip

RUN unzip *.zip -d /rocrail-app
RUN rm *.zip

ENTRYPOINT ["/rocrail-app/bin/rocrail"]
CMD ["-w /rocrail-data"]
CMD ["-l /rocrail-app"]
CMD ["-i /rocrail-data/rocrail_server.ini"]
