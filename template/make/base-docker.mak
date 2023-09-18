run:
	docker compose up -d

restart: docker compose build && \
	docker compose restart

build:
	docker compose build

down:
	docker compose down

downall:
	docker compose down --rmi all --volumes --remove-orphans

logs:
	docker compose logs -f

watch:
	watch docker compose ps
