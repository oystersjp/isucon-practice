IMAGE_NAME = isucon3-base

.PHONY: *

# see: https://qiita.com/mikene_koko/items/4c71c969f55e3fe24190
test: build
	docker run --rm -it --detach --privileged \
	    --publish 80 --publish 1022:22 ${IMAGE_NAME} /sbin/init
	@echo "awaiting for initializing..." && sleep 3
	$(MAKE) apply host=localhost user=root port=1022 key=test/ssh.pem

build:
	docker build --tag ${IMAGE_NAME} .

clean:
	-docker kill $$(docker ps -q --filter "ancestor=${IMAGE_NAME}")

apply: host=
apply: user=ec2-user
apply: port=22
apply: key=
apply:
	itamae ssh --host ${host} --user ${user} --port ${port} --key ${key} --sudo roles/app.rb
