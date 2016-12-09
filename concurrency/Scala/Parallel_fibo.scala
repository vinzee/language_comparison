import scala.concurrent.{Await, Future, Promise}
import scala.concurrent.duration._
import scala.concurrent.ExecutionContext.Implicits.global


object Parallel_fibo
{
  def fibonacci(n: Int): Int =
    if (n < 2) 1
    else fibonacci(n - 1) + fibonacci(n - 2)

  def parallel_fibonacci(n: Int): Int =
    if (n < 2) 1
    
    else 
    {
      //Future runs algorithms concurrently. It returns at some point. Promise gurantees that it returns. 
      //Future starts running concurrently when you create it. 
      val f1 = Future { fibonacci(n - 1) }
      val f2 = Future { fibonacci(n - 2) }

      //Promise makes sure the result is returned. 
      val sum = Promise[Int]
      f1 onSuccess {
        case a =>
          f2 onSuccess {
            case b =>
            //If both of the cases are successful. Compute the sum. 
              sum.success(a + b)
          }
      }
      //Await the result. Duration is infinite
      Await.result(sum.future, Duration.Inf)
  }

  def time[R](block: => R): R = {  
        val t0 = System.nanoTime()
        val result = block    // call-by-name
        val t1 = System.nanoTime()
        println("Elapsed time: " + (t1 - t0) + "ns")
        result
  }

  def main(args: Array[String]): Unit = {
    val res = time {(parallel_fibonacci(10))}
    println(res)

    val mb = 1024*1024
    val runtime = Runtime.getRuntime
    println("\nMemory in MB")
    println("** Used Memory:  " + (runtime.totalMemory - runtime.freeMemory))
    println("** Free Memory:  " + runtime.freeMemory)
    println("** Total Memory: " + runtime.totalMemory)
    println("** Max Memory:   " + runtime.maxMemory)
  }
}
