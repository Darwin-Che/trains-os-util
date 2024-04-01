CONTAINER_NAME=trains-os-util-builder

build: docker
	docker compose exec builder make

clean:
	docker compose exec builder make clean

docker:
	[[ "$$(docker ps -f "name=$(CONTAINER_NAME)" --format '{{.Names}}')" == "$(CONTAINER_NAME)" ]] || \
	docker compose run --name $(CONTAINER_NAME) -d builder

.PHONY: build clean docker