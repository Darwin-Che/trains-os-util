build:
	docker compose run builder make

clean:
	docker compose run builder make clean

docker:
	docker compose build

.PHONY: build clean docker