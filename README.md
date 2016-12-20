# Language Comparison
Compare the 3 languages **Go,Elixir & Scala** across multiple aspects such as -
- JSON parsing
- DB operations
- Concurrency
- Regex Matching
- Socket programming
- Inmemory cache


## Running the program benchmarks
Please Install the all the dependencies listed at the bottom and then run the following commands
```sh
sudo chmod +x runElixir.sh
sudo chmod +x runGoProg.sh
sudo chmod +x runScala.sh

sudo ./runElixir.sh
sudo ./runGoProg.sh
sudo ./runScala.sh

```

# Installation Steps
### Elixir Installation

```sh
# install erlang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang

# install elixir
sudo apt-get install elixir
```

###  Go Installation
```sh
# 1) Go Download link https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
# 2) extract it into /usr/local
# 3) export PATH=$PATH:/usr/local/go/bin
# 4) export GOROOT=/usr/local/go
# 5) export GOPATH=/home/user_name/Documents/go  ##replace user_name accordingly
# 6) sudo apt-get install mercurial
# 7) go get github.com/gonum/plot
# 8) go get github.com/go-sql-driver/mysql
# 9) go get github.com/gonum/plot/plotter
```

### Scala Installation

```sh
echo "You will need SBT to run this program. Installing it. ============>"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

```


### MySQL Installation
```sh
# login to mysql (provide your password)
mysql -u root -p

# run the following commands in the mysql shell
CREATE DATABASE language_comparison;
USE language_comparison;
CREATE USER 'guest'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'guest'@'localhost';
source /path_to_project/language_comparison/database/db.sql
```

### Important links -
- http://elixir-lang.org/docs/stable/elixir/api-reference.html
- Elixir - https://elixir.libhunt.com
- Benchfella Elixir profiler - https://github.com/alco/benchfella
- JSON parser - https://github.com/cblage/elixir-json