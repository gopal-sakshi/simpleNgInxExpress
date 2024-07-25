FROM node:16.20.2

ADD package.json /tmp/package.json
ADD package-lock.json /tmp/package-lock.json
RUN cd /tmp && npm install

WORKDIR /app
RUN cp -a /tmp/node_modules /app
ADD . /app

ARG PORT
EXPOSE $PORT

ENTRYPOINT ["npm", "start"]

### the node application --> always runs on 3055 port
### but inside a docker container --> 3 docker containers -- all of them have node running on 3055
### we use 3 different ports on host machine