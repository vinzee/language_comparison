package main

import (
	"net"
	"fmt"
	"bufio"
	"strconv"
	//"strings"
	)

func main(){
	//fmt.Println("Server started")
	listen, err := net.Listen("tcp", ":8081")
	if(err != nil){
		fmt.Println(err.Error())
	}
	conn, err := listen.Accept()
	if(err != nil){
			fmt.Println(err.Error())
	}
	defer listen.Close()
	for {
		msg, err := bufio.NewReader(conn).ReadString('\n')
		if(err != nil){
			//fmt.Println("Client closed the connection")
			break	
		}
		//fmt.Print("Client:", string(msg))
		reply := "length of message is " + strconv.Itoa(len(msg)-1) + "\n"
		//fmt.Print("Server:", reply)
		conn.Write([]byte(reply))
	}
}