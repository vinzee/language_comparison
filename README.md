# Language Comparison
Compare the 3 languages **Go,Elixir & Scala** across multiple aspects such as -
- JSON parsing
- DB operations
- Concurrency
- Regex Matching
- Socket programming
- Inmemory cache

# Installation Steps
### Elixir Installation
```sh
# install erlang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang

# install elixir
sudo apt-get install elixir

# download all dependencies
mix deps.get
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
### MySQL installation
```sh
# login to mysql
mysql -u root -p

# run the following commands in the mysql shell
CREATE DATABASE language_comparison;
USE language_comparison;
CREATE USER 'guest'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'guest'@'localhost';
source ~/code/language_comparison/database/db.sql
```

### Important links -
- http://elixir-lang.org/docs/stable/elixir/api-reference.html
- Elixir - https://elixir.libhunt.com
- Benchfella Elixir profiler - https://github.com/alco/benchfella
- JSON parser - https://github.com/cblage/elixir-json