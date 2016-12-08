defmodule EmailValidator do
	use Benchfella
	Benchfella.start([{:bench_count, 1}])

	def validate_email(email) when is_binary(email) do
		result = Regex.match?(~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, email)

	  	case result do
			true -> {:success, "'#{email}' is a valid email."}
			false -> {:error, "'#{email}' is an invalid email"}
	  	end
	end

	bench "email validator" do
		# IO.inspect :erlang.process_info(self(), :memory)
		EmailValidator.validate_email("vinzee93@gmail.com")
	end

end