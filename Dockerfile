FROM alpine:latest
MAINTAINER Sergey Korolev "ovst91@gmail.com"
RUN apk add --update nodejs nodejs-npm
COPY . /app
WORKDIR /app/app
#ENTRYPOINT ["node"]
CMD ["npm", "start"]
 