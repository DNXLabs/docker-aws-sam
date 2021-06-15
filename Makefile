IMAGE_NAME ?= dnxsolutions/aws-sam:latest

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(PWD):/opt/app --entrypoint "/bin/sh" $(IMAGE_NAME)

lint:
	docker run --rm -i -v $(PWD)/hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile