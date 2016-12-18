defmodule NetworkProgramming do
  use Benchfella
  Benchfella.start

  def initiate do
		{:ok, socket} = :gen_tcp.connect('127.0.0.1', 4040, [:binary, packet: 0])
		:ok = :gen_tcp.send(socket, 'Hello !')

		case :gen_tcp.recv(socket, 0) do
      {:ok, data} ->
        IO.puts "data received ! #{data}"
        :gen_tcp.send(socket, '#{String.length(data)}\n')
      {:error, :closed} -> :closed # "Socket is closed !"
      _ -> :ok
		end

		:ok = :gen_tcp.close(socket)
	end

  bench "NetworkProgramming" do
    NetworkProgramming.initiate
  end

end

# telnet 127.0.0.1 4040
