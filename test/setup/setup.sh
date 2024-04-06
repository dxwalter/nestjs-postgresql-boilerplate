clear

export POSTGRES_DATABASE=wellat_market_test_api_2

export NOCK_TEST=false


node_modules/.bin/sequelize db:create
npm run migrate:test
npx sequelize-cli db:seed:all
