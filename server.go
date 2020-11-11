package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/tree", func(w http.ResponseWriter, r *http.Request){
        fmt.Fprintf(w, "Trees :]")
    })


	fmt.Printf("Starting server at port 8080\n")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatal(err)
    }
}
