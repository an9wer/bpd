IMAGE = shadowsocks_image
CONTAINER = shadowsocks_container
LOG = shadowsocks.log
CONFIG = config.json

DOCKER := docker
JOURNALCTL := journalctl

.PHONY: build run restart log clean

build: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

run: $(LOG) $(CONFIG)
	$(DOCKER) run -d \
		--name $(CONTAINER) \
		--network host \
		--log-driver journald \
		--restart unless-stopped \
		--mount type=bind,source="$$(pwd)"/$(LOG),target=/app/shadowsocks/$(LOG) \
		--mount type=bind,source="$$(pwd)"/$(CONFIG),target=/app/shadowsocks/$(CONFIG),readonly \
		$(IMAGE)

restart:
	$(DOCKER) restart $(CONTAINER)

log:
	$(JOURNALCTL) CONTAINER=$(CONTAINER)
	
clean:
	-$(DOCKER) stop $(CONTAINER)
	-$(DOCKER) rm   $(CONTAINER)
	-$(DOCKER) image rm $(IMAGE)

$(LOG):
	touch $(LOG)

$(CONFIG):
	cp $(CONFIG){.example,}
