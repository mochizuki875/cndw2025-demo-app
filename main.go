package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func main() {
	handlerFunc := func(w http.ResponseWriter, r *http.Request) {
		io.WriteString(w, "❄️ Welcome to Cloud Native Days Winter 2025 ❄️\n")
	}

	http.HandleFunc("/", handlerFunc)
	fmt.Println("Start Listening 0.0.0.0:8080")
	log.Fatal(http.ListenAndServe("0.0.0.0:8080", nil))
}
