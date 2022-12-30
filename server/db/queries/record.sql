
-- name: CreateRecord :one
INSERT INTO records
(id, unit, value, type)
VALUES ($1, $2, $3, $4) RETURNING *;

-- name: GetRecords :many
SELECT * FROM records
ORDER BY created_at DESC;



