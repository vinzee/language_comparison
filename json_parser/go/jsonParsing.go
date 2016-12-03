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

func FileIo() {
	 jsonFile, err := os.Open(`jsonData.txt`)
	 if err != nil {
        fmt.Printf("error opening file", err.Error())
     }
     jsonParser := json.NewDecoder(jsonFile)
     array  := make([]Data, 1000)
     if err = jsonParser.Decode(&array); err != nil {
         fmt.Printf("parsing json file", err.Error())
     }
     max := -1
     for i := 0; i<1000; i++{
     	if(array[i].Price>max){
     		max = array[i].Price
     	}
 	 }
 	//fmt.Printf("%d\n", max)
}

func BenchmarkFileIo(b *testing.B) {
    for i := 0; i < b.N; i++ {
         FileIo()
    }
}

func main() {
    //fmt.Println(http.ListenAndServe("localhost:6060", nil))
    br := testing.Benchmark(BenchmarkFileIo)
    fmt.Println("time for parallel fibonacci program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for parallel fibonacci program in Go is ", br.AllocedBytesPerOp(), " bytes")
}