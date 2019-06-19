FROM node:latest
MAINTAINER Sergey Korolev "ovst91@gmail.com"
RUN npm install pm2@latest -g
COPY . /app
WORKDIR /app
ENTRYPOINT ["pm2 start"]
CMD ["app/counter-service.js"]
