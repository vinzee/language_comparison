defmodule NetworkProgramming do
	use Benchfella
	Benchfella.start([{:bench_count, 1}])

	def start do
		socket = Socket.Web.connect! "echo.websocket.org"
		socket |> Socket.Web.send!({:ping, "hello!"})

		case socket |> Socket.Web.recv! do
		  { _, data } ->
			len = String.length(data)
		    # IO.puts "client received data #{len}"
		end
	end

	bench "Network Programming" do
		# IO.inspect :erlang.process_info(self(), :memory)
		NetworkProgramming.start
	end
end