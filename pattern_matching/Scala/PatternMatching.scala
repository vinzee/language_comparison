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

    def time[R](block: => R): R = {  
        val t0 = System.nanoTime()
        val result = block    // call-by-name
        val t1 = System.nanoTime()
        println("Elapsed time: " + (t1 - t0) + "ns")
        result
    }

    def main(args: Array[String]): Unit = {

    	
    	time{println(emailValidator("hs11@umbc.edu"))}
    	time{println(emailValidator("hs11umbc.edu"))}

        val mb = 1024*1024
        val runtime = Runtime.getRuntime
        println("\nMemory in MB")
        println("** Used Memory:  " + (runtime.totalMemory - runtime.freeMemory)/mb)
        println("** Free Memory:  " + runtime.freeMemory / mb)
        println("** Total Memory: " + runtime.totalMemory / mb)
        println("** Max Memory:   " + runtime.maxMemory / mb)
    }
}