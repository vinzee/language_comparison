import collection.immutable.IndexedSeq
import com.google.gson.Gson
import com.google.gson.JsonObject
import com.google.gson.JsonParser

case class wrapperObject(val json_string: Array[MyJsonObject])
case class MyJsonObject(val id:Int ,val price:Int)

object Test1 {

    val gson = new Gson()
    def main(args: Array[String])={
        val json_string = scala.io.Source.fromFile("jsonData.json").getLines.mkString
        //val json_string= """{"json_string":[{"id":1,"price":4629},{"id":2,"price":7126},{"id":3,"price":8862},{"id":4,"price":8999},{"id":5,"price":1095}]}"""
        val jsonStringAsObject= new JsonParser().parse(json_string).getAsJsonObject
        val objectThatYouCanPlayWith:wrapperObject = gson.fromJson(jsonStringAsObject, classOf[wrapperObject])
        var maxPrice:Int = 0
        for(i <- objectThatYouCanPlayWith.json_string if i.price>maxPrice) 
        {
            maxPrice=  i.price
        }
        println(maxPrice)
    }
}
