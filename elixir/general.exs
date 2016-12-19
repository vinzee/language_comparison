defprotocol MathOp do
  def max(data)
end

defimpl MathOp, for: List do
  def max(tuple), do: Enum.max(tuple)
end

IO.puts MathOp.max([1,2,3])