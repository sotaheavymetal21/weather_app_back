APP_CONTAINER_NAME = app
DB_CONTAINER_NAME = db
RUN_APP = docker-compose exec $(APP_CONTAINER_NAME)
RUN_POETRY =  $(RUN_APP) poetry run
RUN_PYTEST = $(RUN_POETRY) pytest

up:
	docker-compose up -d

build:
	docker-compose build


down:
	docker-compose down

app:
	docker exec -it $(APP_CONTAINER_NAME) bash

db:
	docker exec -it $(DB_CONTAINER_NAME) bash

test:
	$(RUN_PYTEST) -vv

format:
	$(RUN_POETRY) black .
	$(RUN_POETRY) isort .

update:
	$(RUN_APP) poetry update