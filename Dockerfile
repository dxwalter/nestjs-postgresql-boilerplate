#Build stage
FROM node:18-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#Build prod stage

FROM node:18-alpine

WORKDIR /usr/src/app

ARG NODE_ENV=development
ENV NODE_ENV={NODE_ENV}
ARG PORT=3000
ENV PORT={PORT}

COPY --from=build /usr/src/app/dist ./dist

COPY package*.json ./

RUN npm install --only=production

RUN npx sequelize-cli db:migrate

RUN rm package*.json

EXPOSE 3000

CMD [ "node", "dist/main.js" ]