.PHONY: helm clean

VERSION := $(shell git describe --tags --abbrev=0 | sed 's/v//')

helm:
	@echo "Create helm chart..."
	@helm package helm/ --version $(VERSION) --app-version $(VERSION) --destination ./charts

clean:
	@echo "Cleaning up..."
	@rm -rf ./charts