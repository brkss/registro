package api

import (
	"bytes"
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	mockdb "github.com/brkss/registro/db/mock"
	db "github.com/brkss/registro/db/sqlc"
	"github.com/brkss/registro/utils"
	"github.com/gin-gonic/gin"
	"github.com/golang/mock/gomock"
	"github.com/google/uuid"
	"github.com/stretchr/testify/require"
)


type eqCreateRecordParams struct {
	arg db.CreateRecordParams
}

func (e eqCreateRecordParams)Matches(x interface{}) bool {
	arg, ok := x.(db.CreateRecordParams)
	if !ok {
		return false
	}
	
	e.arg.ID = arg.ID 
	return true;	
}

func (e eqCreateRecordParams)String() string{
	return fmt.Sprintf("id matches %v ", e.arg.ID)
}

func EqCreateRecordParams(arg db.CreateRecordParams) gomock.Matcher{
	return &eqCreateRecordParams{
		arg: arg,
	}
}

func CreateRecord()(db.Record, string){
	uuid := uuid.New().String()

	record := db.Record{
		ID: uuid,
		Unit: utils.RandomString(5),
		Value: int32(utils.RandomInt(40, 400)),
		Type: utils.RandomType(),
		CreatedAt: time.Now(),
	}
	
	return record, uuid 
}


func TestCreateRecordAPI(t *testing.T){
	record, _:= CreateRecord()

	testCases := [] struct{
		name string 
		body gin.H
		buildStabs func(store *mockdb.MockStore)
		checkResponse func(recorder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			body: gin.H{
				"type": record.Type,
				"unit": record.Unit,
				"value": record.Value,
			},
			buildStabs: func(store *mockdb.MockStore){
				arg := db.CreateRecordParams{
					ID: record.ID,
					Unit: record.Unit,
					Value: record.Value,
					Type: record.Type,
				}
				store.EXPECT().CreateRecord(gomock.Any(), EqCreateRecordParams(arg)).
					Times(1).
					Return(record, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder){
				require.Equal(t, http.StatusOK, recorder.Code)
			},
		},
		{
			name: "BadRequest",
			body: gin.H{
				"type": record.Type,
				"unit": record.Unit,
			},
			buildStabs: func(store *mockdb.MockStore){
				store.EXPECT().CreateRecord(gomock.Any(), gomock.Any()).
				Times(0).
				Return(db.Record{}, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder){
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
		{
			name: "InternalServerError",
			body: gin.H{
				"type": record.Type,
				"unit": record.Unit,
				"value": record.Value,
			},
			buildStabs: func(store *mockdb.MockStore){
				store.EXPECT().CreateRecord(gomock.Any(), gomock.Any()).
				Times(1).
				Return(db.Record{}, sql.ErrConnDone)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder){
				require.Equal(t, http.StatusInternalServerError, recorder.Code)
			},
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T){
			
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			tc.buildStabs(store)

			data, err := json.Marshal(tc.body)
			require.NoError(t, err)

			url := "/record"
			request, err := http.NewRequest(http.MethodPost, url, bytes.NewReader(data))
			require.NoError(t , err)

			server := NewServer(store)
			recorder := httptest.NewRecorder()

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		
		})
	}
}

func TestGetRecords(t *testing.T){

}
