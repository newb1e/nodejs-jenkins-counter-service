FROM node:latest-alpine
MAINTAINER Sergey Korolev "ovst91@gmail.com"
RUN apt-get update -y
COPY ./app /app
WORKDIR /app
ENTRYPOINT ["node"]
CMD ["counter-service.js"]
