socket = Socket.Web.connect! "echo.websocket.org"

case socket |> Socket.Web.recv! do
  {:text, data} ->
    # process data
    IO.puts "client received data - #{data} "
  {:ping, _ } ->
    IO.puts "client received ping"
    socket |> Socket.Web.send!({:pong, ""})
  _ ->
    IO.puts "client received something"
end