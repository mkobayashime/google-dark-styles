prettier = yarn run prettier --ignore-path .gitignore
stylelint = yarn run stylelint '**/*.scss'
sass = yarn run sass --no-source-map src:dist

node_modules: package.json yarn.lock
	yarn install
	@touch node_modules

format: node_modules FORCE
	$(prettier) --write .

format.check: node_modules FORCE
	$(prettier) --check .

lint: node_modules FORCE
	$(stylelint)

lint.fix: node_modules FORCE
	$(stylelint) --fix

dev: node_modules FORCE
	$(sass) --watch

build: node_modules FORCE
	$(sass)

clear: FORCE
	rm -rf dist/*

FORCE:
