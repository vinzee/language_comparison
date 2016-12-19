defmodule Greetings do
	def greet(%{"first_name" => fname, "last_name" => ""}) do
		IO.puts "Hii #{fname} !"
	end

	def greet(%{"first_name" => fname, "last_name" => lname}) do
		IO.puts "Hello #{fname} #{lname} !"
	end
end

Greetings.greet(%{"first_name" => "Vineet", "last_name" => ""})
Greetings.greet(%{"first_name" => "Vineet", "last_name" => "Ahirkar"})