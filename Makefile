VERSION = 0.24.2-dnx1 
IMAGE_NAME ?= dnxsolutions/aws-sam:$(VERSION)
TAG = $(VERSION)

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(PWD):/opt/app --entrypoint "/bin/sh" $(IMAGE_NAME) 

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
