package db

import (
	"context"
	"testing"

	"github.com/brkss/registro/utils"
	"github.com/google/uuid"
	"github.com/stretchr/testify/require"
)

func CreateRecord(t *testing.T) Record {
	
	arg := CreateRecordParams{
		ID: uuid.New().String(),
		Unit: utils.RandomString(5),
		Value: int32(utils.RandomInt(40, 400)),
		Type: utils.RandomType(),
	}

	record, err := testQueries.CreateRecord(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, record)

	require.Equal(t, record.ID, arg.ID)
	require.Equal(t, record.Unit, arg.Unit)
	require.Equal(t, record.Value, arg.Value)
	require.Equal(t, record.Type, arg.Type)

	return record
}

func TestCreateRecord(t *testing.T){
	CreateRecord(t)
}

func TestGetRecords(t *testing.T){
	n := 10;

	for i := 0; i < n; i++ {
		CreateRecord(t)
	}

	records, err := testQueries.GetRecords(context.Background())
	require.NoError(t, err)
	require.NotEmpty(t, records)

	for _, record := range records {
		require.NotEmpty(t, record)
	}

}
