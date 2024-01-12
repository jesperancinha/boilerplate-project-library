b: build
build: build-npm
build-npm:
	yarn && npm run build
audit:
	npm audit fix && yarn
update-snyk:
	npm i -g snyk
update:
	find . -name "package-lock.json" | xargs rm; \
	find . -name "yarn.lock" | xargs rm; \
	git pull; \
	curl --compressed -o- -L https://yarnpkg.com/install.sh | bash; \
	npm install caniuse-lite; \
	npm install -g npm-check-updates; \
	yarn; \
	npx browserslist --update-db; \
	ncu -u; \
	yarn
