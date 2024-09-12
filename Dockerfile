FROM nginx:latest
RUN sed -i 's/nginx/alioune/g' /usr/share/nginx/html/index.html
EXPOSE 80
