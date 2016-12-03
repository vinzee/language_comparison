package main

import (
 // "net/http"
 // _"net/http/pprof"
"fmt"
"testing"
)

func fibo(n int) int {
	done := make(chan bool)
	if n == 0 || n == 1 {
		return n
	}
	x := 0
	y := 0
	go func() {
		x = fibo(n - 1)
		done <- true
	}()
	go func() {
		y = fibo(n - 2)
		done <- true
	}()
	<-done
	<-done
	return x + y
}

func BenchmarkFibo(b *testing.B) {
    for i := 0; i < b.N; i++ {
         fibo(10)
    }
}

func main() {
    br := testing.Benchmark(BenchmarkFibo)
    fmt.Println("time for parallel fibonacci program in Go is ", br.NsPerOp(), " nanosecons")
    fmt.Println("memory for parallel fibonacci program in Go is ", br.AllocedBytesPerOp(), " bytes")
}