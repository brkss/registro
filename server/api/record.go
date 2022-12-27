package api

import (
	"net/http"

	db "github.com/brkss/registro/db/sqlc"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)


type CreateRecordRequest struct {
	Unit 	string 	`json:"unit" binding:"required"`
	Value 	int32 	`json:"value" binding:"required"`
	Type	string 	`json:"type" binding:"required"` 	
}



func (server *Server)CreateRecorAPI(ctx *gin.Context){

	var req CreateRecordRequest
	
	err := ctx.ShouldBindJSON(&req)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errResponse(err))
		return 
	}

	arg := db.CreateRecordParams{
		ID: uuid.New().String(),
		Unit: req.Unit,
		Value: req.Value,
		Type: req.Type,
	}

	record, err := server.store.CreateRecord(ctx, arg)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errResponse(err))
		return;
	}

	ctx.JSON(http.StatusOK, record)
}


func (server *Server)GetRecordsAPI(ctx *gin.Context){

	records, err := server.store.GetRecords(ctx) 
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errResponse(err))
		return;
	}

	ctx.JSON(http.StatusOK, records)

}


