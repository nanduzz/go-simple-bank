createdb:
	docker-compose -f docker-compose-dev.yaml up -d

dropdb:
	docker-compose -f docker-compose-dev.yaml down

migrateup:
	migrate -path db/migration -database "postgresql://root:example@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://root:example@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:example@localhost:5432/simple_bank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:example@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/nanduzz/simplebank/db/sqlc Store

.PHONY: createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc server