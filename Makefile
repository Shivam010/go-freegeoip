fmt:
	GO111MODULE=on go fmt ./...

lint: fmt
	GO111MODULE=on go vet --vettool=${GOPATH}/bin/shadow ./...
	staticcheck ./...

clean: lint
	GO111MODULE=on go mod tidy

build: clean
	GO111MODULE=on go vet ./...
	GO111MODULE=on go build ./...

test: build
	GO111MODULE=on go test -timeout 5m -race -covermode=atomic -coverprofile=coverage.out ./...

license:
	addlicense -c "Shivam Rathore" -v .

.PHONY: test build clean lint fmt license
