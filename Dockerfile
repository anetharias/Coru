FROM mhart/alpine-node:14
WORKDIR '/app'
COPY ./package.json ./
RUN yarn
COPY . . 
RUN yarn build

FROM nginx 
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# COPY /opt/elasticbeanstalk/deployment/ /var/app/current/ 
