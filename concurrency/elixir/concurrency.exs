defmodule Fibonacci do
  use Benchfella
  Benchfella.start([{:bench_count, 1}])

  def spawn_run(pid, n) do
    spawn __MODULE__, :send_run, [pid, n]
  end

  def send_run(pid, n) do
    send pid, fib(n)
  end

  def fib(0) do 0 end
  def fib(1) do 1 end

  def fib(n) do
		spawn_run(self, n - 1)
		spawn_run(self, n - 2)

    receive do
	  	x ->
	    receive do
		  	y ->
  				x + y
    	end
    end
	end

  bench "parallel fibonnaci generator" do
    Fibonacci.fib(10)
  end
end