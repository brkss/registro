package main

import (
	"database/sql"
	"log"

	"github.com/brkss/registro/api"
	db "github.com/brkss/registro/db/sqlc"
	"github.com/brkss/registro/utils"
	_ "github.com/lib/pq"
)




func main(){

	config, err := utils.LoadConfig()
	if err != nil {
		log.Fatal("Error: cannot load config !")
	}
	

	con, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("Error: cannot connect to database !")
	}

	store := db.NewStore(con)
	server := api.NewServer(store)
	
	server.Start("0.0.0.0:4000")


}
