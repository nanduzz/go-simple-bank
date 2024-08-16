createdb:
	docker-compose -f docker-compose-dev.yaml up -d

dropdb:
	docker-compose -f docker-compose-dev.yaml down

migrateup:
	migrate -path db/migration -database "postgresql://root:example@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:example@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb dropdb migrateup migratedown sqlc