cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

.PHONY:	all
all:	latest version

.DEFAULT_GOAL := all

latest:
	docker build --build-arg HUGO_VERSION=$(HUGO_VERSION) -t devopstales/hugo:latest .

version:
	docker build --build-arg HUGO_VERSION=$(HUGO_VERSION) -t devopstales/hugo:$(HUGO_VERSION) .

push:
	docker push devopstales/hugo:latest
	docker push devopstales/hugo:$(HUGO_VERSION)
