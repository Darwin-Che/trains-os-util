build:
	docker compose run builder make

clean:
	docker compose run builder make clean

.PHONY: build clean