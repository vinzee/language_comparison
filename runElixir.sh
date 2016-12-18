#!/bin/bash
printf "\n"
sudo mix run network_programming/elixir/server.exs &
sleep 3
sudo mix run network_programming/elixir/client.exs
printf "\n"
mix run concurrency/elixir/concurrency.exs
printf "\n"
mix run database/elixir/database_operations.exs
printf "\n"
mix run inmemory_cache/elixir/inmemory_cache.exs
printf "\n"
mix run json_parser/elixir/json_parser.exs
printf "\n"
mix run pattern_matching/elixir/pattern_matching.exs
printf "\n"
# etc.