setup:
	bin/setup

migrate:
	bin/rails db:migrate

deploy:
	git push heroku main

slim_lint:
	bundle exec slim-lint app/views

rubocop:
	rubocop -a

linters: rubocop slim_lint

tests:
	NODE_ENV=test bin/rails test

start:
	bin/rails server

seed:
	bin/rails db:seed

.PHONY: test
