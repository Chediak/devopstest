FROM node:18

WORKDIR /usr/src/app

RUN npm install -g flowise

RUN mkdir -p /root/.flowise

EXPOSE 3000

CMD ["flowise", "start"] 