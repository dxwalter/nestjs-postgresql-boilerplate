clear

export POSTGRES_DATABASE=wellat_market_test_api_2

export NOCK_TEST=true


node_modules/.bin/sequelize db:create
npm run migrate:dev:up
npx sequelize-cli db:seed:all
