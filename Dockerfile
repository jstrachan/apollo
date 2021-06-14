FROM node:10.15.3-alpine


ENV PORT 8080 
EXPOSE 8080
WORKDIR /app

RUN apk add --no-cache tini git

COPY package*.json ./

COPY . .


RUN yarn && (test -f ./packages/server/dev-db.sqlite3 || yarn seed) && yarn build

CMD [ "yarn", "start" ]



