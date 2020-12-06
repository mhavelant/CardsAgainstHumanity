package main

import (
	"github.com/gorilla/mux"
	"html/template"
	"log"
	"net/http"
	"os"
	"time"
)

var tpl = template.Must(template.ParseFiles("templates/index.html"))

func indexHandler(w http.ResponseWriter, r *http.Request) {
	_ = tpl.Execute(w, nil)
}

func main() {
	r := mux.NewRouter()

	// @todo: Only for testing, should decouple it later. Maybe try using vue.js?
	r.HandleFunc("/", indexHandler)

	publicFs := http.FileServer(http.Dir("assets"))
	r.PathPrefix("/css/").Handler(publicFs)
	r.PathPrefix("/js/").Handler(publicFs)
	r.PathPrefix("/ico/").Handler(publicFs)


	port := os.Getenv("PORT")
	address := ":"+port

	server := &http.Server {
		Handler: r,
		Addr: address,
		// Good practice: enforce timeouts for servers you create!
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Println("Listening on :", address)
	log.Fatal(server.ListenAndServe())
}
