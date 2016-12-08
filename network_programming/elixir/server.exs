server = Socket.Web.listen! 80
client = server |> Socket.Web.accept!

case client |> Socket.Web.recv! do
  {_, data} ->
    # IO.puts "server received data - #{data} "
    client |> Socket.Web.send!({:ping, data})
end