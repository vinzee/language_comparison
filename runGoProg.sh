#!/bin/bash
printf "\n"
go run network_programming/go/server.go	&
sleep 5
go run network_programming/go/client.go	
printf "\n"
go run concurrency/go/parallel_fibo.go
printf "\n"
go run database/go/database.go
printf "\n"
go run inmemory_cache/go/map.go
printf "\n"
go run json_parser/go/jsonParsing.go
printf "\n"
go run pattern_matching/go/pattern_matching.go	
printf "\n"
go run graph_plot/go/graph.go	
printf "\n"
# etc.