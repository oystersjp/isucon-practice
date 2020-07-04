IMAGE_NAME = isucon3-base

.PHONY: *

# see: https://qiita.com/mikene_koko/items/4c71c969f55e3fe24190
test: build
	docker run --rm -it --detach --privileged \
	    --publish 80 \
		--volume $(PWD)/../:/opt/isucon3-mod ${IMAGE_NAME} /sbin/init
	@echo "awaiting for initializing..." && sleep 3
	docker exec -it $$(docker ps -q --filter "ancestor=${IMAGE_NAME}") make -C /opt/isucon3-mod/provision run/locally
	#$(MAKE) clean

build:
	docker build --tag ${IMAGE_NAME} .

clean:
	-docker kill $$(docker ps -q --filter "ancestor=${IMAGE_NAME}")

run/locally:
	itamae local roles/app.rb
	bash
