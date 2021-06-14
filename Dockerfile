FROM node:10.15.3-alpine


WORKDIR /app

RUN apk add --no-cache tini git

COPY package*.json ./

COPY . .

EXPOSE 8080

CMD [ "yarn && (test -f ./packages/server/dev-db.sqlite3 || yarn seed) && yarn build && yarn start" ]


