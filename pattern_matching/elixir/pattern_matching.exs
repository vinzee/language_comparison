defmodule EmailValidator do

	def validate_email(email) when is_binary(email) do

		result = Regex.match?(~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, email)

	  	case result do
			true -> {:success, "'#{email}' is a valid email."}
			false -> {:error, "'#{email}' is an invalid email"}
	  	end

	end

end

IO.puts elem(EmailValidator.validate_email("vinzee93@gmail.com"), 1)
IO.puts elem(EmailValidator.validate_email("vinzee93"), 1)