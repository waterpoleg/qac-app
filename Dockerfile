FROM node:16

EXPOSE 3000

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY package.json /home/node/app
COPY src /home/node/app/src
COPY public /home/node/app/public

RUN npm i

CMD npm run start