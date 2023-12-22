.PHONY: build clean

VERSION := $(shell git describe --tags --abbrev=0 | sed 's/v//')

build:
	@echo "Create helm chart..."
	@helm package . --version $(VERSION) --app-version $(VERSION)

clean:
	@echo "Cleaning up..."
	@rm -rf *.tgz

install:
	@echo "Install helm chart..."
	@helm upgrade -i quasar-project -f values.yaml .

uninstall:
	@echo "Uninstall helm chart..."
	@helm uninstall quasar-project

