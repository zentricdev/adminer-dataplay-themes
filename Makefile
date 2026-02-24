.PHONY: up down restart rebuild

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
