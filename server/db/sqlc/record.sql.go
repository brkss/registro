// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.16.0
// source: record.sql

package db

import (
	"context"
)

const createRecord = `-- name: CreateRecord :one
INSERT INTO records
(id, unit, value, type)
VALUES ($1, $2, $3, $4) RETURNING id, unit, value, type, created_at
`

type CreateRecordParams struct {
	ID    string `json:"id"`
	Unit  string `json:"unit"`
	Value int32  `json:"value"`
	Type  string `json:"type"`
}

func (q *Queries) CreateRecord(ctx context.Context, arg CreateRecordParams) (Record, error) {
	row := q.db.QueryRowContext(ctx, createRecord,
		arg.ID,
		arg.Unit,
		arg.Value,
		arg.Type,
	)
	var i Record
	err := row.Scan(
		&i.ID,
		&i.Unit,
		&i.Value,
		&i.Type,
		&i.CreatedAt,
	)
	return i, err
}

const deleteQuery = `-- name: DeleteQuery :exec
DELETE FROM records
WHERE id = $1
`

func (q *Queries) DeleteQuery(ctx context.Context, id string) error {
	_, err := q.db.ExecContext(ctx, deleteQuery, id)
	return err
}

const getRecords = `-- name: GetRecords :many
SELECT id, unit, value, type, created_at FROM records
ORDER BY created_at DESC
`

func (q *Queries) GetRecords(ctx context.Context) ([]Record, error) {
	rows, err := q.db.QueryContext(ctx, getRecords)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Record{}
	for rows.Next() {
		var i Record
		if err := rows.Scan(
			&i.ID,
			&i.Unit,
			&i.Value,
			&i.Type,
			&i.CreatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
