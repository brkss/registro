package api

import (
	db "github.com/brkss/registro/db/sqlc"
	"github.com/gin-gonic/gin"
)

type Server struct {
	store db.Store;
	router *gin.Engine
}

func NewServer(store db.Store) *Server{
	server := &Server{store: store}
	router := gin.Default()

	router.POST("/record", server.CreateRecorAPI)
	router.GET("/records", server.GetRecordsAPI)

	server.router = router;
	return server;
}

func (server *Server)Start(address string) {
	server.router.Run(address)
}

func errResponse(err error) gin.H{
	return gin.H{
		"error": err.Error(),
	}
}
