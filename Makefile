.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: lint
lint:  ## Linter the code.
	isort app tests --check
	flake8 app tests
	darglint app


.PHONY: tests
tests:  ## Test your code.
	python3 -m pytest tests
.PHONY: generate_client
generate_client:
	openapi-python-client --config client-config.yaml generate --url http://localhost:8000/openapi.json

.PHONY: update_client
update_client:
	openapi-python-client --config client-config.yaml update --url http://localhost:8000/openapi.json

