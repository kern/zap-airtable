.PHONY: install
install:
	npm install

.PHONY: build
build: node_modules
	./node_modules/.bin/tsc

.PHONY: lint
lint: node_modules
	./node_modules/.bin/eslint --fix 'src/**/*.ts'

.PHONY: deploy
deploy: node_modules build
	test -n "$(NAME)" # $$NAME required
	gcloud functions deploy $(NAME) \
		--runtime nodejs10 \
		--trigger-http \
		--entry-point perform \
		--env-vars-file .env.yaml

node_modules:
	npm install
