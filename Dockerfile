FROM node:20.10.0-alpine as build
WORKDIR /usr/app
COPY . /usr/app
RUN yarn install
RUN yarn run build
 
FROM nginx:1.24-alpine
EXPOSE 80
COPY ./conf/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /usr/app/build /usr/share/nginx/html