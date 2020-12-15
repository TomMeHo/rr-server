FROM ubuntu:latest
RUN apt install unzip \
    && wget https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-1191-Ubuntu1804-AMD64.zip \
    && mkdir /rocrail-app \
    && unzip -*.zip -d /rocrail-app \
    && rm *.zip
VOLUME /rocrail-data
ENTRYPOINT ["/rocrail-app/bin/rocrail"]
CMD ["-w /rocrail-data"]
