# Detect container engine: podman or docker
DOCKER_BIN := $(shell command -v podman >/dev/null 2>&1 && echo podman || echo docker)

# Detect compose file: prefer podman-compose.yml for podman
ifeq ($(DOCKER_BIN),podman)
  COMPOSE_FILE := $(shell [ -f podman-compose.yml ] && echo podman-compose.yml || echo docker-compose.yml)
else
  COMPOSE_FILE := $(shell [ -f docker-compose.yml ] && echo docker-compose.yml || echo podman-compose.yml)
endif

# Compose wrapper
COMPOSE := $(DOCKER_BIN)-compose -f $(COMPOSE_FILE)

# --- General Targets ---

up:
	$(COMPOSE) up

down:
	$(COMPOSE) down

build:
	$(COMPOSE) build

rebuild:
	$(COMPOSE) build --no-cache

logs:
	$(COMPOSE) logs -f

clean:
	$(DOCKER_BIN) system prune -a -f --volumes

test:
	@echo "Running backend API test..."
	curl -X POST -F "file=@sample.jpg" http://localhost:8000/process-image/ -o out.png || echo "Test failed"
	@echo "You can check out.png to verify the result."

deploy: build up

# --- Shell Access ---

backend-shell:
	$(DOCKER_BIN) exec -it $$(\
		$(DOCKER_BIN) ps --filter "name=backend" --format "{{.ID}}" | head -n 1) sh

frontend-shell:
	$(DOCKER_BIN) exec -it $$(\
		$(DOCKER_BIN) ps --filter "name=frontend" --format "{{.ID}}" | head -n 1) sh

# --- Component-Specific Targets ---

backend-build:
	$(DOCKER_BIN) build -t backend ./backend

frontend-build:
	$(DOCKER_BIN) build -t frontend ./frontend

backend-up:
	$(DOCKER_BIN) run -p 8000:8000 backend

frontend-up:
	$(DOCKER_BIN) run -p 3000:80 frontend
