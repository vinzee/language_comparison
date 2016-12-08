defmodule DatabaseOperations do
	use Benchfella
	Benchfella.start

	# make connection to mysql
	@db Mariaex.Connection.start_link(username: "guest", password: 'admin123', database: "language_comparison")

	def get_data(db) do
		# fire query
		{_, data} = Mariaex.query(db, "SELECT * FROM student where name='vineet'")
		rows = Map.get(data, :rows)
		rows
	end

	bench "DatabaseOperations" do
		{_, db} = @db
		get_data(db)
	end
end