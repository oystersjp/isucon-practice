IMAGE_NAME = isucon3-base
.PHONY: *

build:
	docker build --pull --tag ${IMAGE_NAME} .

test:
	docker run --rm -it -v $(PWD):/opt/app ${IMAGE_NAME} make -C /opt/app run/locally

run/locally:
	itamae local roles/app.rb

