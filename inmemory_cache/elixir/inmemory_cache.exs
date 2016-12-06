defmodule InMemoryCache do
  use Benchfella
  Benchfella.start

	def makeRequest(cache, key) do
		val = Map.get(cache, key)

		if val != nil do # hit
			val
		else # miss
			if Map.size(cache) > 1000 do
				# evict from map
				random_key = Enum.random(Map.keys(cache))
				Map.delete(cache, random_key)
 				Map.put(cache, key, "Testing val")
			else
				# append to map
				Map.put(cache, key, "Testing val")
			end
		end

		cache[key]
	end

	def benchmarkRequest(cache, n) when n == 0 do
	    makeRequest(cache, :rand.uniform(3000))
	end

	def benchmarkRequest(cache, n) do
		# random integer between 0 to 3000
		makeRequest(cache, :rand.uniform(3000))
		InMemoryCache.benchmarkRequest(cache, n-1)
	end

 	bench "inmemory cache" do
		InMemoryCache.benchmarkRequest(%{}, 100)
	end
end