FROM nginx:stable

EXPOSE 80

RUN apt-get update \
    && apt-get update -y \
    && apt-get install -y bash wget

RUN rm -f /etc/nginx/conf.d/default.conf
RUN rm -f /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html index.css /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]