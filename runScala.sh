#!/bin/bash
echo "Starting the execution of scala programs"
echo
echo "Network Programming"

printf "\n"
scala network_programming/Scala/ChatServer.scala &
sleep 2
scala network_programming/Scala/ChatClient.scala
printf "\n"

sleep 3
echo "Concurrency"
scala concurrency/Scala/Parallel_fibo.scala
printf "\n"

sleep 3
echo "Database"
cd database/Scala/
scala -classpath "*.jar" ScalaDatabase.scala
cd ../../
printf "\n"

sleep 3
echo "In memory cache"
scala inmemory_cache/Scala/Caching.scala
printf "\n"

sleep 3
echo "JSON Parser running via SBT"
cd json_parser/Scala/json_parser/
printf "\n"
sbt run
cd ../../../
printf "\n"

sleep 3
echo "Pattern Matching"
scala pattern_matching/Scala/PatternMatching.scala
printf "\n"