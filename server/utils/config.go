package utils

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
)



type Config struct {
	DBSource string
	DBDriver string 
}


func LoadConfig() (*Config, error){

	err := godotenv.Load()
	if err != nil {
		return nil, err
	}

	config := &Config{
		DBSource: os.Getenv("DB_SOURCE"),
		DBDriver: os.Getenv("DB_DRIVER"),
	}

	fmt.Printf("config : %v\n", config)


	return config, nil
}
