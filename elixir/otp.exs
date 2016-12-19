# https://blog.drewolson.org/understanding-gen-server/

defmodule Stack do
  use GenServer

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, state) do
    [head|new_state] = state

    {:reply, head, new_state}
  end

  def handle_cast({:push, value}, state) do
    {:noreply, [value|state]}
  end
end

# start_link params - module name, initial state
{:ok, pid} = :gen_server.start_link(Stack, [], [])
# synchronous
IO.inspect :gen_server.call(pid, :pop)

# asynchronous
IO.inspect :gen_server.cast(pid, {:push, 1})
IO.inspect :gen_server.cast(pid, {:push, 2})
IO.inspect :gen_server.call(pid, :pop)
IO.inspect :gen_server.call(pid, :pop)