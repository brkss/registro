package api

import (
	db "github.com/brkss/registro/db/sqlc"
	"github.com/google/uuid"
)


func CreateRecord()(db.Record, string){
	uuid := uuid.New().String()

	record := db.Record{
		ID: uuid,
		Unit: "mg/",
	}
}


func TestCreateRecordAPI(t *testing.T){

}
