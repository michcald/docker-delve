DLV_PORT := 2345

up: # starts delve with the go binary within docker
	DLV_PORT=$(DLV_PORT) docker-compose up --force-recreate --build

clean:
	DLV_PORT=$(DLV_PORT) docker-compose rm --force

dlv: # this is the delve client that connects to delve running in docker
	dlv connect localhost:$(DLV_PORT)