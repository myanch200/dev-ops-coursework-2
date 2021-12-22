FROM node:6.14.2
EXPOSE 8080
COPY server.js .
CMD echo "hello world"
CMD node server.js
