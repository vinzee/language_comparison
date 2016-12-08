server = Socket.Web.listen! 8080
client = server |> Socket.Web.accept!
Socket.Web.close 8080

case client |> Socket.Web.recv! do
  {_, data} ->
    # IO.puts "server received data - #{data} "
    client |> Socket.Web.send!({:ping, data})
end
