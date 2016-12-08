package main

import (
	"fmt"
	"testing"
	"regexp"
)

var m = make(map[int]string)

func emailValidator(email string) bool{
	re := regexp.MustCompile(`^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$`)
	if(re.MatchString(email)){
		return true
	}
	return false
}

func BenchmarkValidator(b *testing.B) {
    for i := 0; i < b.N; i++ {
          _ = emailValidator("vinzee93@gmail.com")
          _ = emailValidator("vinzee93")
	}
}

func main(){
	br := testing.Benchmark(BenchmarkValidator)
    fmt.Println("time for pattern matching program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for pattern matching program in Go is ", br.AllocedBytesPerOp(), " bytes")
}