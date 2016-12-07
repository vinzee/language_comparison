defmodule DatabaseOperations do
	use Benchfella
	Benchfella.start

	# make connection to mysql
	@db Mariaex.Connection.start_link(username: "root", password: 'admin123', database: "elixir")

	def get_student(db, name) do
		# fire query
		{_, data} = Mariaex.query(db, "SELECT * FROM student where name='#{name}'")

		rows = Map.get(data, :rows)
		# IO.inspect rows
		rows
	end

	bench "DatabaseOperations" do
		{_, db} = @db
		get_student(db, 'vineet')
	end
end