package main

import (
  //  "net/http"
  // _"net/http/pprof"
	"fmt"
	"testing"
	"time"
	"math/rand"
)

var cache = make(map[int]string, 1000)

func Request(key int) (string, bool){
	if val, ok := cache[key];ok{
		return val, true // hit
	} else{ // miss
		if(len(cache)>1000){ // if size of m is >1000 need to evict
			for k := range cache { //evict a random element
				delete(cache, k)
       			cache[key] = "Testing val"	
       			break
   			}
		} else {	// else append the new key value pair to the map
			 cache[key] = "Testing val\n"
		}
	}

	return cache[key], false
}

func BenchmarkRequest(b *testing.B) {
	//var m = make(map[int]string)
    for i := 0; i < b.N; i++ {
    	k := rand.Intn(3000) // random integer between 0 to 3000
        _, _ = Request(k)
	}
}


func main(){
	//fmt.Println(http.ListenAndServe("localhost:6060", nil))
	rand.Seed(time.Now().UTC().UnixNano())
	br := testing.Benchmark(BenchmarkRequest)
    fmt.Println("time for inmemory cache program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for inmemory cache program in Go is ", br.AllocedBytesPerOp(), " bytes")
}