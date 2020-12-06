package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"net/http"
	"os"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	_, _ = w.Write([]byte("<h1>Hello World!</h1>"))
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", indexHandler)

	port := os.Getenv("PORT")
	address := ":"+port

	_ = http.ListenAndServe(":"+port, r)
	fmt.Println("Listening on :", address)
}
