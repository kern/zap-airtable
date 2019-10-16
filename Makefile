.PHONY: install
install:
	npm install

.PHONY: build
build: node_modules
	./node_modules/.bin/tsc

.PHONY: lint
lint: node_modules
	./node_modules/.bin/eslint --fix 'src/**/*.ts'

.PHONY: deploy/zip
deploy/zip: node_modules build
	mkdir -p build
	zip -r build/function.zip package.json package-lock.json index.js dist

.PHONY: deploy/function
deploy/function: node_modules config.yaml build
	test -n "$(NAME)" # $$NAME required
	gcloud functions deploy $(NAME) \
		--runtime nodejs10 \
		--trigger-http \
		--entry-point perform \
		--env-vars-file config.yaml

node_modules:
	npm install
