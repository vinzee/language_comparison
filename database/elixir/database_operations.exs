defmodule DatabaseOperations do
	use Benchfella
	Benchfella.start

	def get_student(name) do
		# make connection to mysql
		{_, db} = Mariaex.Connection.start_link(username: "root", password: 'admin123', database: "elixir")

		# fire query
		{_, data} = Mariaex.query(db, "SELECT * FROM student where name='#{name}'")

		rows = Map.get(data, :rows)

		# TODO - find a way to close the connection
		# IO.inspect rows

		rows
	end

	bench "DatabaseOperations" do
		get_student('vineet')
	end
end