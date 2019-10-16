.PHONY: install
install:
	npm install

.PHONY: build
build: node_modules
	./node_modules/.bin/tsc
	mkdir -p build
	zip -r build/function.zip package.json package-lock.json index.js dist

.PHONY: lint
lint: node_modules
	./node_modules/.bin/eslint --fix 'src/**/*.ts'

.PHONY: deploy
deploy: node_modules build
	gsutil cp build/function.zip gs://zap-airtable/function.zip

node_modules:
	npm install
