FROM nginx

  RUN apt-get update -qq && apt-get -y install apache2-utils
  ENV NODE_ROOT /var/www/api-gateway
  WORKDIR $NODE_ROOT
  RUN mkdir log
  COPY app.conf /tmp/app.nginx
  COPY nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt
  COPY nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key
  RUN envsubst '$NODE_ROOT' < /tmp/app.nginx > /etc/nginx/conf.d/default.conf

  EXPOSE 4100

  CMD [ "nginx", "-g", "daemon off;" ]

