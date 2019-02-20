target ?= server

IMAGE = kcptun_$(target)_image
CONTAINER = kcptun_$(target)_container
LOG = $(target).log
CONFIG = $(target).json

CMD = $(target) -c $(CONFIG)

DOCKER := docker
JOURNALCTL := journalctl

.PHONY: build run restart log clean

build: Dockerfile check_target
	$(DOCKER) build -t $(IMAGE) .

run: $(LOG) $(CONFIG) check_target
	$(DOCKER) run -d \
		--name $(CONTAINER) \
		--network host \
		--log-driver journald \
		--restart unless-stopped \
		--mount type=bind,source="$$(pwd)"/$(LOG),target=/app/kcptun/$(LOG) \
		--mount type=bind,source="$$(pwd)"/$(CONFIG),target=/app/kcptun/$(CONFIG),readonly \
		$(IMAGE) $(CMD)

restart: check_target
	$(DOCKER) restart $(CONTAINER)

log: check_target
	$(JOURNALCTL) CONTAINER=$(CONTAINER)
	
clean: check_target
	-$(DOCKER) stop $(CONTAINER)
	-$(DOCKER) rm   $(CONTAINER)
	-$(DOCKER) image rm $(IMAGE)

$(LOG):
	touch $(LOG)

$(CONFIG):
	cp $(CONFIG).example $(CONFIG)

check_target:
	@if [ $(target) != server -a $(target) != client ]; then \
		echo "Makefile variable 'target' can only be set to server or client."; \
		exit 1; \
	fi

