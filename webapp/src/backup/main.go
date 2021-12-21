package main

import (
"database/sql"
"fmt"
"os"
"strconv"
"log"
"net/http"
_ "github.com/lib/pq"
)


var db *sql.DB

func init() {
var err error

// Define variables assignments
host     := os.Args[1]
port     := os.Args[2]
user     := os.Args[3]
password := os.Args[4]
dbname   := os.Args[5]
//table    := os.Args[6]

// Convert string port to integer
portc, _ := strconv.Atoi(port)

connStr := fmt.Sprintf("host=%s port=%d user=%s "+
                       "password=%s dbname=%s sslmode=disable",
	               host, portc, user, password, dbname)

db, err = sql.Open("postgres", connStr)

if err != nil {
panic(err)
}

if err = db.Ping(); err != nil {
panic(err)
}
// this will be printed in the terminal, notifying that we successfully connected to our database
fmt.Println("You are now connected to the devdatabase database.\n")
}

type info struct {
id int
Age int
Email string
Firstname string
Lastname string
}

func main() {
http.HandleFunc("/store", storeIndex)
http.ListenAndServe(":8080", nil)
}

func storeIndex(w http.ResponseWriter, r *http.Request) {

fmt.Fprintf(w, "Cool, your connected to the browser \n")

if r.Method != "GET" {
http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
return
}

rows, err := db.Query("SELECT * FROM info")


if err != nil {
http.Error(w, http.StatusText(500), http.StatusInternalServerError)
return
}
defer rows.Close()

usrs := make([]info, 0)

for rows.Next() {
usr := info{}
err := rows.Scan(&usr.id, &usr.Age, &usr.Email, &usr.Firstname, &usr.Lastname)
if err != nil {
log.Println(err)
http.Error(w, http.StatusText(500), 500)
return
}
usrs = append(usrs, usr)
}

if err = rows.Err(); err != nil {
http.Error(w, http.StatusText(500), 500)
return
}

for _, usr := range usrs {
fmt.Fprintf(w, "%d %d %s %s %s\n", usr.id, usr.Age, usr.Email, usr.Firstname, usr.Lastname)
}
}
