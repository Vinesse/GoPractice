package main

import (
    "fmt"
    "log"
    "net/http"
)
func helloHandler(w http.ResponseWriter, r *http.Request) {
    if r.URL.Path != "/tree" {
        http.Error(w, "404 not found.", http.StatusNotFound)
        return
    }

    if r.Method != "GET" {
        http.Error(w, "405 method is not supported.", http.StatusNotFound)
        return
	}
	
    fmt.Fprintf(w, "Tree!")
}

func main() {
    http.HandleFunc("/tree", helloHandler)


	fmt.Printf("Starting server at port 8080\n")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatal(err)
    }
}
