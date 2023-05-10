run:
	docker-compose up -d

logs:
	docker-compose logs -f

down:
	docker-compose down

c:
	docker exec -it wikmd bash

downall:
	docker-compose down --rmi all --volumes --remove-orphans
