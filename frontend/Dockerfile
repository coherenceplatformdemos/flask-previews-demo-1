FROM debian

RUN mkdir /app
WORKDIR /app

COPY . . 

RUN mkdir assets
RUN chmod -R 0777 .
RUN chmod +x build.sh