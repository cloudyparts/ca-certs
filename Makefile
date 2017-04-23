VERSION = 1.0.0
REGISTRY = docker.io
NAMESPACE = cloudyparts
IMAGE = ca-certs

.PHONY: build tag push release

build:
	mkdir -p $(PWD)/assets
	docker build -t builder-$(IMAGE) -f Dockerfile.builder .
	docker run --rm -v $(PWD)/assets:/assets builder-$(IMAGE):latest
	docker build -t $(NAMESPACE)/$(IMAGE):$(VERSION) -f Dockerfile .
	docker rmi builder-$(IMAGE):latest
	rm -Rf $(PWD)/assets

tag:
	docker tag $(NAMESPACE)/$(IMAGE):$(VERSION) $(NAMESPACE)/$(IMAGE):$(TAG)

push:
	TAG=$(TAG) make --no-print-directory tag
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):$(TAG)

release:
	@docker login -u $(DOCKER_USER) -p $(DOCKER_USER_TOKEN)
	VERSION=$(VERSION) make --no-print-directory build
	TAG=$(VERSION) make --no-print-directory push
	TAG=latest make --no-print-directory push
	docker rmi $(NAMESPACE)/$(IMAGE):latest
	docker rmi $(NAMESPACE)/$(IMAGE):$(VERSION)
