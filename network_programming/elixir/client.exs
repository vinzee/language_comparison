use Timex

socket = Socket.Web.connect! "echo.websocket.org"

socket |> Socket.Web.send!({:ping, "hello!"})

t1 = Duration.now
IO.inspect t1

case socket |> Socket.Web.recv! do
  { _, data } ->
	IO.inspect Duration.diff(Duration.now, t1, :seconds)
    IO.puts "client received data #{String.length(data)}"
end