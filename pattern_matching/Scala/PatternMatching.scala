import scala.util.matching.Regex

object PatternMatching
{
	def emailValidator(email: String): Boolean = {
    	//"""(\w+)@([\w\.]+)""".r.unapplySeq(email).isDefined
    	var e = """^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$""".r
    	if(email.matches(e.toString))
    		return true
    	else
    		return false
    }

    def main(args: Array[String]): Unit = {
    	
    	println(emailValidator("hs11@umbc.edu"))
    	println(emailValidator("hs11umbc.edu"))
    }
}