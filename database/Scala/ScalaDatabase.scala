import java.sql.Connection
import java.sql.ResultSet
import java.sql.DriverManager


object ScalaDatabase{

	def getData(conn:Connection) : String = {
	  
	  println("In get data")
		Class.forName("com.mysql.jdbc.Driver").newInstance();
    val st = conn.createStatement()
		val rs = st.executeQuery("select * from student where name = 'Shantanu'")
		var result = ""
		//println("COUNT")
		while(rs.next())
		{
			val id = rs.getInt("id")
			val name = rs.getString("name")
			val uni = rs.getString("university")
			val age = rs.getInt("age")
			result = "Student id is: " + id + "\n" + "Student name is: " + name + "\n" + "Student university is: " + uni + "\n" + "Student age is: " + age
		}
		
		rs.close() 
		//conn.close()
		return result
		
	}

	def time[R](block: => R): R = {  
    	val t0 = System.nanoTime()
    	val result = block    // call-by-name
    	val t1 = System.nanoTime()
    	println("Elapsed time: " + (t1 - t0) + "ns")
    	result
	}

	def main(args: Array[String]): Unit = {
	  
	  var conn:Connection = null

		conn = DriverManager.getConnection("jdbc:mysql://localhost/language_comparison", "guest", "admin123")

		val result = time {getData(conn)}
		println(result)

        val runtime = Runtime.getRuntime
        println("** Used Memory:  " + (runtime.totalMemory - runtime.freeMemory))
	}
}