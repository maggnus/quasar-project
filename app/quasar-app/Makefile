.PHONY: build run clean

APP_NAME := quasar-app

build:
	@echo "Building $(APP_NAME)..."
	@go build -o $(APP_NAME)

run:
	@echo "Running $(APP_NAME)..."
	@go run server.go

clean:
	@echo "Cleaning up..."
	@rm -f $(APP_NAME)

docker_build:
	@echo "Build docker image..."
	@docker build -t $(APP_NAME) .

docker_run:
	@echo "Run docker container..."
	@docker run -p 9000:9000 $(APP_NAME)