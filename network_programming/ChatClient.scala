import java.net._
import java.io._

object ChatClient{

	def message() : Unit = {

		val br = new BufferedReader(new InputStreamReader(System.in))
		val s = new Socket("localhost",1234)
		val dis = new DataInputStream(s.getInputStream())
		val dos = new DataOutputStream(s.getOutputStream())
		var msg = ""

		msg = ("Hello")
		println("Client just replied with: " + msg)	
		dos.writeUTF(msg)
		msg = dis.readUTF()
		println("Server: " + msg)
		s.close
	}

	def time[R](block: => R): R = {  
        val t0 = System.nanoTime()
        val result = block    // call-by-name
        val t1 = System.nanoTime()
        println("Elapsed time: " + (t1 - t0) + "ns")
        result
    }

	def main(args: Array[String]): Unit = {

		time{message()}

		val mb = 1024*1024
	    val runtime = Runtime.getRuntime
	    println("\nMemory in MB")
	    println("** Used Memory:  " + (runtime.totalMemory - runtime.freeMemory))
	    println("** Free Memory:  " + runtime.freeMemory / mb)
	    println("** Total Memory: " + runtime.totalMemory / mb)
	    println("** Max Memory:   " + runtime.maxMemory / mb)

	}
}