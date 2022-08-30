SHELL := /bin/bash

# Testing running system

# For testing a simple query on the system. Don't forget to `make seed` first.
# curl --user "admin@example.com:gophers" http://localhost:3000/v1/users/token
# export TOKEN="COPY TOKEN STRING FROM LAST CALL"
# curl -H "Authorization: Bearer ${TOKEN}" http://localhost:3000/v1/users/1/2
#
# For testing load on the service.
# go install github.com/rakyll/hey@latest
# hey -m GET -c 100 -n 10000 -H "Authorization: Bearer ${TOKEN}" http://localhost:3000/v1/users/1/2
#
# Access metrics directly (4000) or through the sidecar (3001)
# go install github.com/divan/expvarmon@latest
# expvarmon -ports=":4000" -vars="build,requests,goroutines,errors,panics,mem:memstats.Alloc"
# expvarmon -ports=":3001" -endpoint="/metrics" -vars="build,requests,goroutines,errors,panics,mem:memstats.Alloc"
#
# To generate a private/public key PEM file.
# openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048
# openssl rsa -pubout -in private.pem -out public.pem
# ./sales-admin genkey
#
# Testing coverage.
# go test -coverprofile p.out
# go tool cover -html p.out
#
# Test debug endpoints.
# curl http://localhost:4000/debug/liveness
# curl http://localhost:4000/debug/readiness
#
# Running pgcli client for database.
# pgcli postgresql://postgres:postgres@localhost
#
# Launch zipkin.
# http://localhost:9411/zipkin/

run:
	go run ./app/services/sales-api/main.go | go run ./app/tooling/logfmt/main.go


# Module support

tidy:
	go mod tidy
	go mod vendor

update:
	go get -u -t -d -v ./...


