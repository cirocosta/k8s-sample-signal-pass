package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM, syscall.SIGUSR1, syscall.SIGUSR2)

	log.Println("waiting for signals to arrive")
	for sig := range sigs {
		log.Printf("received signal: %+v", sig)
	}
}
