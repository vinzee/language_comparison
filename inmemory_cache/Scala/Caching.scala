import scala.collection.mutable.Map
import scala.util.Random


object Caching {

	val TestMap = Map[Int, String]()

	def cache(key: Int) = {

		if(TestMap.size > 1000){

			val random = new Random
			val r_val = TestMap(random.nextInt(TestMap.size)).toInt

			//var r_val = TestMap.toVector(random(TestMap.size))
			TestMap -= r_val
			TestMap += (key -> "Testing val")
		}
		else{
			TestMap += (key -> "Testing val")
		}

		
	}

	def time[R](block: => R): R = {  
        val t0 = System.nanoTime()
        val result = block    // call-by-name
        val t1 = System.nanoTime()
        println("Elapsed time: " + (t1 - t0) + "ns")
        result
  	}

	def main(args: Array[String]): Unit = {

		val rand = new Random
		
		for (a <- 0 to 1000){

			time {cache(rand.nextInt(3000))}
		}

		val mb = 1024*1024
    	val runtime = Runtime.getRuntime
    	println("\nMemory in MB")
    	println("** Used Memory:  " + (runtime.totalMemory - runtime.freeMemory) / mb)
    	println("** Free Memory:  " + runtime.freeMemory / mb)
    	println("** Total Memory: " + runtime.totalMemory / mb)
    	println("** Max Memory:   " + runtime.maxMemory / mb)		
	}
	
}