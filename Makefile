.DEFAULT_GOAL := help

help: ## Show help
	@echo "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:"
	@grep -E '^[a-zA-Z0-9_/%\-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-28s\033[0m %s\n", $$1, $$2}'

run: ## Run dev environment: start the docker image and run logs
	docker-compose up --detach
	docker-compose logs --follow

stop: ## Stop dev environment
	docker-compose -f docker-compose.yml down
