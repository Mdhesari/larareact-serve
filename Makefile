up:
	docker compose up -d
down:
	docker compose down
logs:
	docker compose logs -f
reup:
	make down && make up
restart:
	docker compose restart
ps:
	docker compose ps