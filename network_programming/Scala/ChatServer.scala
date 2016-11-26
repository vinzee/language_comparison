import java.net._
import java.io._

object ChatServer{
	def main(args: Array[String]): Unit = {
		
		try{
			val br = new BufferedReader(new InputStreamReader(System.in))
			val ss = new ServerSocket(1234)
			val s: Socket = ss.accept()
			val dis = new DataInputStream(s.getInputStream())
			val dos = new DataOutputStream(s.getOutputStream())
			var msg = ""

			while(true){
				msg = dis.readUTF();
				println("Client: " + msg);
				print("Server: ");
				msg = br.readLine();
				dos.writeUTF(msg);
			}
		}
		catch{
  				case e: Exception => println(e.getStackTrace); System.exit(1)

		}
	}
}