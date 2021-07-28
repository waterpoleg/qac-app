### STAGE 1: Build
#FROM node:latest as builder
FROM node:16-alpine as builder

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY ./package.json /package.json
COPY ./nginx.conf /nginx.conf

RUN npx yarn cache clean
RUN npx yarn install --production=true --force

COPY ./ /

RUN npx yarn build

#CMD npm run start

### STAGE 2: Production Environment ###
FROM nginx:latest

COPY --from=builder ./build /var/www
COPY --from=builder ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]