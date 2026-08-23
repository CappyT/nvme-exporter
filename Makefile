GOARCH ?= $(shell go env GOARCH)

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=$(GOARCH) go build -trimpath -o ./dist/linux_$(GOARCH)/nvme_exporter ./cmd

docker: build
	docker build -t nvme-exporter:dev .

.PHONY: build docker
