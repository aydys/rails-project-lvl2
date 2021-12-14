deploy:
	git push heroku main
run_slim_lint:
	bin/rake slim_lint
run_rubocop:
	rubocop -a
run_linters: run_rubocop run_slim_lint
