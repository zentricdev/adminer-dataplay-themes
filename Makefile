.PHONY: up down restart rebuild

COMPOSE_PROJECT_NAME=dataplay

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

restart:
	@$(MAKE) down
	@$(MAKE) up

rebuild:
	docker compose down -v
	docker compose up -d --build
