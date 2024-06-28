.PHONY : build up down clean
docker_compose:= docker compose

OS := $(shell uname -s)

build:
ifeq ($(OS),Linux)
	   @echo "running in $(OS)"
	   $(docker_compose) build
endif
up:
	   $(docker_compose) up -d
down:
	   $(docker_compose) down
clean:
	   docker system prune -f
