.PHONY: build setup run

build: setup
	cd ./src && go build -o ./src/app app.go

setup:
	go get github.com/go-sql-driver/mysql
	go get github.com/gorilla/mux
	go get github.com/gorilla/sessions
	go get github.com/bradfitz/gomemcache/memcache

run:
	cd ./src && ./src/app
