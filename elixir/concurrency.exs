defmodule MathOp do
	def multiply(pid, a,b) do
  		send(pid, a*b)
	end

	def square(n) do
  		spawn(MathOp, :multiply, [self, n, n])

	    receive do
		  	x ->
		  		IO.puts "Square of #{n} is #{x}"
		end
	end
end

MathOp.square(5)
