FROM nginx

  RUN apt-get update -qq && apt-get -y install apache2-utils
  ENV NODE_ROOT /var/www/api-gateway
  ENV DOLLAR='$'
  WORKDIR $NODE_ROOT
  RUN mkdir log
  COPY app.conf.template /etc/nginx/templates/app.conf.template
  COPY nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt
  COPY nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key


  EXPOSE 4100

  CMD [ "nginx", "-g", "daemon off;" ]

