defmodule SocketServer do
  def accept do
    # The options below mean:
    #
    # 1. `:binary` - receives data as binaries (instead of lists)
    # 2. `packet: :line` - receives data line by line
    # 3. `active: false` - blocks on `:gen_tcp.recv/2` until data is available
    # 4. `reuseaddr: true` - allows us to reuse the address if the listener crashes
    #
    case :gen_tcp.listen(4040, [:binary, packet: :line, active: false, reuseaddr: true]) do
      {:ok, socket} ->
        loop_acceptor(socket)
        :gen_tcp.close(socket)

      {:error, :eaddrinuse} -> :ok
    end

  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    client |> read_line
    loop_acceptor(socket)

  end

  defp read_line(socket) do
    case :gen_tcp.recv(socket, 0) do
        {:ok, data} ->
          IO.puts "data received ! #{data}"
          :gen_tcp.send(socket, '#{String.length(data)}\n')
        {:error, :closed} -> :closed # "Socket is closed !"
        _ -> :ok
    end
  end
end

SocketServer.accept