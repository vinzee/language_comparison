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

echo "You will need SBT to run this program. Installing it. ============>"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

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