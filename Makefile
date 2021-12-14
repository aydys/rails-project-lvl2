setup:
	bin/setup
deploy:
	git push heroku main

slim_lint:
	bin/rake slim_lint

rubocop:
	rubocop -a

linters: run_rubocop run_slim_lint

tests:
	NODE_ENV=test bin/rails test

.PHONY: test
