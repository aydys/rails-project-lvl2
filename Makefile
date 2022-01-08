setup:
	bin/setup

migrate:
	bin/rails db:migrate

deploy:
	git push heroku main && heroku run rails db:migrate

slim_lint:
	bin/rake slim_lint

rubocop:
	rubocop -a

linters: rubocop slim_lint

tests:
	NODE_ENV=test bin/rails test

.PHONY: test
