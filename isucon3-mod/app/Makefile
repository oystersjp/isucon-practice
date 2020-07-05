GO=go

.PHONY: build setup run

build: setup
	cd ./src && ${GO} build -o ./app app.go

setup:
	${GO} get github.com/go-sql-driver/mysql
	${GO} get github.com/gorilla/mux
	${GO} get github.com/gorilla/sessions
	${GO} get github.com/bradfitz/gomemcache/memcache

run:
	cd ./src && ./app
