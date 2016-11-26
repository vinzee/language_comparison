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
	} else{ // miss
		if(len(m)>1000){ // if size of m is >1000 need to evict
			m[1] = "Testing val"
			//fmt.Printf("evict\n")
		} else {	// else append the new key value pair to the map
			 l := len(m)
			 m[l] = "Testing val\n"
		}
	}
	return m[key], false
}

func BenchmarkRequest(b *testing.B) {
    for i := 0; i < b.N; i++ {
    	 k := rand.Intn(3000) // random integer between 0 to 3000
         _, _ = Request(k)
	}
}

func main(){
	rand.Seed(time.Now().UTC().UnixNano())
	br := testing.Benchmark(BenchmarkRequest)
    fmt.Println(br)
}