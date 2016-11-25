package main

import (
	"fmt"
	"testing"
	"time"
	"math/rand"
)

var m = make(map[int]string)

func Request(key int) (string, bool){
	if val, ok := m[key];ok{
		return val, true // hit
	} else{
		if(len(m)>1000){	 // miss
			m[1] = "Testing val"
			//fmt.Printf("evict\n")
		} else {
			 l := len(m)
			 m[l] = "Testing val\n"
		}
	}
	return m[key], false
}

func BenchmarkRequest(b *testing.B) {
    for i := 0; i < b.N; i++ {
    	 k := rand.Intn(3000)
         _, _ = Request(k)
	}
}

func main(){
	rand.Seed(time.Now().UTC().UnixNano())
	br := testing.Benchmark(BenchmarkRequest)
    fmt.Println(br)
}