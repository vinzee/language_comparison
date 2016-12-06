server = Socket.Web.listen! 80
client = server |> Socket.Web.accept!

# here you can verify if you want to accept the request or not, call
# `Socket.Web.close!` if you don't want to accept it, or else call
# `Socket.Web.accept!`
client |> Socket.Web.accept!

# echo the first message
client |> Socket.Web.send!(client |> Socket.Web.recv!)

Socket.Web.send!({:ping, ""})

case client |> Socket.Web.recv! do
  {:text, data} ->
    # process data
    IO.puts "server received data - #{data} "
  {:pong, _ } ->
    IO.puts "server received pong"
    client |> Socket.Web.send!({:ping, ""})
  _ ->
    IO.puts "server received something"
end