FROM alpine:latest
MAINTAINER Sergey Korolev "ovst91@gmail.com"
RUN apk add --update nodejs nodejs-npm
RUN npm install pm2@latest -g
COPY . /app
WORKDIR /app
#ENTRYPOINT ["node"]
CMD ["pm2 start app/counter-service.js"]
