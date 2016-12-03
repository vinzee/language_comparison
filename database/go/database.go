package main

import (
    "database/sql"
    "strconv"
    "testing"
    "fmt"
    _ "github.com/go-sql-driver/mysql"
)

type Student struct{
	Id int
	Name string
	Uni string
	Age int
}

func getData() string{
	database := "Scala"
	user := "guest"
	password := "mysql123"
	con, err := sql.Open("mysql", user+":"+password+"@/"+database)
	if(err!=nil){
		panic(err.Error())
	}
	query := "select * from student where name = ?"
	row := con.QueryRow(query, "Shantanu")
	rs := new(Student)
	err = row.Scan(&rs.Id, &rs.Name, &rs.Uni, &rs.Age)
	if(err!=nil){
		fmt.Println(err);
	}
	result := "Student id is: " + strconv.Itoa(rs.Id) + "\n" + "Student name is: " + rs.Name + "\n" + "Student university is: " + rs.Uni + "\n" + "Student age is: " + strconv.Itoa(rs.Age)
	defer con.Close()	
	return result
}

func BenchmarkgetData(b *testing.B) {
    for i := 0; i < b.N; i++ {
   		getData()
	}
}

func main() {
    br := testing.Benchmark(BenchmarkgetData)
    fmt.Println("time for databse  program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for database program in Go is ", br.AllocedBytesPerOp(), " bytes")
}