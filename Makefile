postgres:
	docker run --name postgres1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=dashe -d postgres:16-alpine

createdb:
	docker exec -it postgres1 createdb --username=root --owner=root sb

dropdb:
	docker exec -it postgres1 dropdb sb

migrateup:
	migrate -path db/migration -database "postgresql://root:dashe@localhost:5432/sb?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:dashe@localhost:5432/sb?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown