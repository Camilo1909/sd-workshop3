FROM node:8.16.0-alpine

COPY ./ ./

# install project dependencies
RUN apk update
RUN apk upgrade --no-cache
RUN npm install -g npm@6.13.4
RUN npm install

# build app for production with minification
RUN npm run build
ENV PORT=8080
ENV AUTH_API_ADDRESS=http://127.0.0.1:8000 
ENV TODOS_API_ADDRESS=http://127.0.0.1:8082

COPY . /app


EXPOSE 8080
CMD [ "npm", "start" ]
