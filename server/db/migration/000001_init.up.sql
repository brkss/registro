CREATE TABLE "records" (
	"id" varchar PRIMARY KEY NOT NULL,
	"unit" varchar NOT NULL,
	"value" integer NOT NULL,
	"type" varchar NOT NULL,
	"created_at" timestamptz NOT NULL DEFAULT (now())
);
