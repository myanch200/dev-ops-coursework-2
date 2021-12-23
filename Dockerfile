FROM node:14
EXPOSE 8080
COPY server.js .
CMD echo "hello world"
CMD node server.js
