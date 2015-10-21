.PHONY: serve
serve:
	broccoli serve

.PHONY: build
build:
	broccoli build dist

.PHONY: deploy
deploy: build
	./deploy.sh
	rm -rf dist/

.PHONY: clean
clean:
	rm -rf dist/ tmp/
