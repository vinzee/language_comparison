import java.sql.Connection
import java.sql.ResultSet
import java.sql.DriverManager


object ScalaDatabase{

	def getData() : String = {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
    var conn:Connection = null

		conn = DriverManager.getConnection("jdbc:mysql://localhost/Scala", "root", "admin123")
		val st = conn.createStatement()
		val rs = st.executeQuery("select * from student where name = 'Shantanu'")
		var result = ""
		while(rs.next())
		{
			val id = rs.getInt("id")
			val name = rs.getString("name")
			val uni = rs.getString("uni")
			val age = rs.getInt("age")
			result = "Student id is: " + id + "\n" + "Student name is: " + name + "\n" + "Student university is: " + uni + "\n" + "Student age is: " + age
		}
		
		rs.close() 
		conn.close()
		return result
		
	}

	def main(args: Array[String]): Unit = {
	  
		val result = getData()
		println(result)

	}
}