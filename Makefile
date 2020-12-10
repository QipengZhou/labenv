export SHELL:=/bin/bash

IMAGE_BASE?=ubuntu
IMAGE_TAG?=18.04
PACKAGE_TYPE?=deb

DOCKER_REPOSITORY?=registry.cn-shenzhen.aliyuncs.com/yicho/labenv-build-tools

debug:
		@echo ${IMAGE_BASE}
		@echo ${IMAGE_TAG}

build-base:
		docker build -f dockerfiles/Dockerfile.$(PACKAGE_TYPE) \
		--build-arg IMAGE_BASE=$(IMAGE_BASE) \
		--build-arg IMAGE_TAG="$(IMAGE_TAG)" \
		-t $(DOCKER_REPOSITORY):$(IMAGE_BASE)-$(IMAGE_TAG) .

publish-base:
		docker push $(DOCKER_REPOSITORY):$(IMAGE_BASE)-$(IMAGE_TAG)
