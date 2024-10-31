package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, World!")
    })

    log.Println("Server is running on port 8081...")
    if err := http.ListenAndServe(":8081", nil); err != nil {
        log.Fatalf("Server failed to start: %v", err)
    }
}
