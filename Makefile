postgres:
	docker run --name postgres1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=dashe -d postgres:16-alpine

createdb:
	docker exec -it postgres1 createdb --username=root --owner=root sb

dropdb:
	docker exec -it postgres1 dropdb sb

.PHONY: postgres createdb dropdb