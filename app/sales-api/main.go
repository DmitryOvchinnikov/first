package main

import (
	"log"
	"os"
)

func main() {
	logger := log.New(os.Stdout, "SALES : ", log.LstdFlags|log.Lmicroseconds|log.Lshortfile)

	if err := run(logger); err != nil {
		log.Println("main: error:", err)
		os.Exit(1)
	}
}

func run(logger *log.Logger) error {

	return nil
}
