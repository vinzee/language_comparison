# Quote
# Unquote
# Macro.escape
# bind_quoted

data = {1, 2, 3}
quote do
  IO.inspect(unquote(Macro.escape(data)))
end


defmodule MyMacro do
  @opts: %{time: :am}

  # case 1
  defmacro one_plus_two do
    {:+, [], [1, 2]}
  end

  # case 2
  defmacro say_hi do
    quote do
      IO.puts "hello world"
    end
  end

  # case 3
  defmacro ops do
    Macro.escape(@opts)
  end
end

defmodule MyModule do
  import Mymacro

  def case1 do
    IO.puts one_plus_two()
  end

  def case2 do
    say_hi()
  end

  def case3 do
    IO.inspect ops()
  end
end

# dynamic generation of functions and nested macros using Unquote fragment.
defmodule MyModule do
  Enum.each [foo: 1, bar: 2, baz: 3], fn { k, v } ->
    def unquote(k)(arg) do
      unquote(v) + arg
    end
  end
end


IO.puts MyModule.foo(1)