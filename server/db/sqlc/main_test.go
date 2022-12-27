package db

import (
	"database/sql"
	"log"
	"os"
	"testing"
	
	_ "github.com/lib/pq"
	//"github.com/stretchr/testify/require"
)
const (
	dbDriver = "postgres"
	dbSource = "postgres://root:root@localhost:5432/registro?sslmode=disable"
)

var testQueries *Queries 

func TestMain(m *testing.M){
	con, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to database !:", err)
	}

	testQueries = New(con)

	os.Exit(m.Run())
}
