### Hexlet tests and linter status:

[![Actions Status](https://github.com/aydys/rails-project-lvl2/workflows/hexlet-check/badge.svg)](https://github.com/aydys/rails-project-lvl2/actions)

[![Actions Status](https://github.com/aydys/rails-project-lvl2/workflows/CI/badge.svg)](https://github.com/aydys/rails-project-lvl2/actions)

[Project Link](https://murmuring-chamber-39882.herokuapp.com/)

### Системные требования

- Ruby
- Node.js
- Yarn
- SQLite3
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)

### Установка

```sh
make setup
make seed
make tests # run tests
make start # run server http://localhost:3000

```

### Deploy

Добавить базу данных

```sh
heroku addons:create heroku-postgresql:hobby-dev
```

Подготовить необходимые переменные окружения:

```sh
heroku config:set SECRET_KEY_BASE=$(rake secret)
heroku config:set RACK_ENV=production
heroku config:set RAILS_ENV=production
heroku config:set RAILS_LOG_TO_STDOUT=enabled
```

Развертывание приложения на heroku

```sh
make deploy
```
