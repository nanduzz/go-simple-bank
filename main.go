package main

import (
	"database/sql"
	"github.com/nanduzz/simplebank/api"
	db "github.com/nanduzz/simplebank/db/sqlc"
	"github.com/nanduzz/simplebank/util"
	"log"

	_ "github.com/lib/pq"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	store := db.NewStore(conn)
	server, err := api.NewServer(config, store)
	if err != nil {
		log.Fatal("cannot create server:", err)
	}

	err = server.Start(config.ServerAdress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}

}
