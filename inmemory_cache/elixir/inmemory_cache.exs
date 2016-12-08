defmodule InMemoryCache do
  use Benchfella
  Benchfella.start

	def request(cache, key) do
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

	def benchmarkRequest(cache) do
	    request(cache, :rand.uniform(3000))
	end

 	bench "inmemory cache" do
		InMemoryCache.benchmarkRequest(%{})
	end
end