package main

import (
 // "net/http"
 // _"net/http/pprof"
"fmt"
"os"
"encoding/json"
"testing"
)

type Data struct {
	Id int `json:"id"`
	Price int `json:"price"`
}

func Parse() {
	 jsonFile, err := os.Open(`json_parser/go/jsonData.txt`)
	 if err != nil {
        fmt.Printf("error while opening file", err.Error())
     }
     jsonParser := json.NewDecoder(jsonFile)
     dataArray  := make([]Data, 1000)
     if err = jsonParser.Decode(&dataArray); err != nil {
         fmt.Printf("error in parsing json file", err.Error())
     }
     max := -1
     for i := 0; i<1000; i++{
     	if(dataArray[i].Price>max){
     		max = dataArray[i].Price
     	}
 	 }
 	//fmt.Printf("%d\n", max)
}

func BenchmarkFileIo(b *testing.B) {
    for i := 0; i < b.N; i++ {
         Parse()
    }
}

func main() {
    //fmt.Println(http.ListenAndServe("localhost:6060", nil))
    br := testing.Benchmark(BenchmarkFileIo)
    fmt.Println("time for json parsing program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for json parsing program in Go is ", br.AllocedBytesPerOp(), " bytes")
}