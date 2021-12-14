deploy:
	git push heroku main

slim_lint:
	bin/rake slim_lint

rubocop:
	rubocop -a

linters: run_rubocop run_slim_lint

tests:
	bin/rake test
