import java.net._
import java.io._

object ChatClient{
	def main(args: Array[String]): Unit = {

		try{
			val br = new BufferedReader(new InputStreamReader(System.in))
			val s = new Socket("localhost",1234)
			val dis = new DataInputStream(s.getInputStream())
			val dos = new DataOutputStream(s.getOutputStream())
			var msg = ""

			while(true){
				print("Client: ")
				msg = br.readLine()
				dos.writeUTF(msg)
				msg = dis.readUTF()
				println("Server: " + msg)
			}

		}
		catch{
  				case e: Exception => println(e.getStackTrace); System.exit(1)

		}		
		

	}
}