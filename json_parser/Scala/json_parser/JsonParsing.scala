//import collection.immutable.IndexedSeq
import com.google.gson.Gson
import com.google.gson.JsonObject
import com.google.gson.JsonParser

case class wrapperObject(val json_string: Array[MyJsonObject])
case class MyJsonObject(val id:Int ,val price:Int)

object JsonParsing {
  
    def maxVal():Integer = {
      
        val json_string = scala.io.Source.fromFile("jsonData1.json").getLines.mkString
        val jsonStringAsObject= new JsonParser().parse(json_string).getAsJsonObject
        val myObj:wrapperObject = gson.fromJson(jsonStringAsObject, classOf[wrapperObject])
        var maxPrice:Int = 0
        for(i <- myObj.json_string if i.price > maxPrice) 
        {
            maxPrice=  i.price
        }
        return maxPrice
    }
  
    def time[R](block: => R): R = {  
        val t0 = System.nanoTime()
        val result = block    // call-by-name
        val t1 = System.nanoTime()
        println("Elapsed time: " + (t1 - t0) + "ns")
        result
    }

    val gson = new Gson()
    
    def main(args: Array[String]): Unit = {
       
      time{println(maxVal())}
      
      val runtime = Runtime.getRuntime
      println("Used Memory:  " + (runtime.totalMemory - runtime.freeMemory))    
    }
}
