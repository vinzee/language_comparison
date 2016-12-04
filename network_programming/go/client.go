package main

import (
"fmt"
"net"
"time"
"bufio"
"runtime"
)


func Client(){
	conn, _ := net.Dial("tcp", "127.0.0.1:8081")
	text := "hello"
	//fmt.Print("Client: ", text, "\n")
	fmt.Fprintf(conn, text + "\n")
	//repl, _ := bufio.NewReader(conn).ReadString('\n')
	_, _ = bufio.NewReader(conn).ReadString('\n')
	//fmt.Print("Server: " + repl)
}

func main() {
	var mem runtime.MemStats
	runtime.ReadMemStats(&mem)
	start := time.Now()
	Client()
	elapsed := time.Since(start)
	elapsedNano := elapsed.Nanoseconds()
	fmt.Println("time for networking program in Go is ", elapsedNano , " nanosecond")
    fmt.Println("memory for networking program in Go is",  mem.HeapAlloc, " bytes")
}
