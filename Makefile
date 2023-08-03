# Makefile generated with pymakefile
help:
	@grep -E '^[A-Za-z0-9_.-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "[36m%-30s[0m %s\n", $$1, $$2}'

migrations:  ## Make django migrations
	docker-compose run --rm app python manage.py makemigrations

migrate:  ## Apply django migrations
	docker-compose run --rm app python manage.py migrate

lint:  ## Fix linter errors
	docker-compose docker-compose run --rm app black .
	docker-compose docker-compose run --rm app isort . --profile black

lint-check:  ## Run linter
	docker-compose docker-compose run --rm appblack . --check
	docker-compose docker-compose run --rm app isort . --check-only --profile black
	docker-compose docker-compose run --rm app flake8 .
