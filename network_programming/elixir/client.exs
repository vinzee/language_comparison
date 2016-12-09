defmodule NetworkProgramming do
	use Benchfella
	Benchfella.start

	def start do
		socket = Socket.Web.connect! "echo.websocket.org"
		socket |> Socket.Web.send!({:ping, "hello!"})

		case socket |> Socket.Web.recv! do
		  { _, data } ->
		    # IO.puts "client received data #{String.length(data)}"
		end
	end

	bench "Network Programming" do
		NetworkProgramming.start
	end
end