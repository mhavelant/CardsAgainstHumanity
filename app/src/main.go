package main

import (
	"github.com/gorilla/mux"
	"html/template"
	"log"
	"net/http"
	"os"
	"path"
	"time"
)

var binDir = currentDir()
var tpl = template.Must(template.ParseFiles(binDir+"/templates/index.html"))

func currentDir() (here string) {
	// @todo: Only for testing, should decouple it later. Maybe try using vue.js?
	if os.Getenv("APP_MODE") == "dev" {
		here = "."
		return
	}

	here = path.Dir(os.Args[0])

	if !path.IsAbs(os.Args[0]) {
		workdir, _ := os.Getwd()
		here = path.Join(workdir, here)
	}

	return
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	_ = tpl.Execute(w, nil)
}

func main() {
	log.Println("Current directory/Workdir: "+currentDir())
	r := mux.NewRouter()

	r.HandleFunc("/", indexHandler)

	publicFs := http.FileServer(http.Dir(binDir+"/assets"))
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
