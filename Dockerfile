FROM node:latest
MAINTAINER Sergey Korolev "ovst91@gmail.com"
RUN apt-get update -y
COPY . /app
WORKDIR /app
ENTRYPOINT ["node"]
CMD ["app/counter-service.js"]
