import java.io._
import java.net.{ InetAddress, ServerSocket, Socket, SocketException }

object MyServer {
	def main(args: Array[String]) {
		if (args.length < 1) {
			printf("scala MyServer port")
			return
		}

		val port: Int = args(0).toInt

				try {
					val listener = new ServerSocket(port)

					val socket = listener.accept()

					val out = new PrintWriter(socket.getOutputStream())
					val in = new BufferedReader(new InputStreamReader(socket.getInputStream()))

					val message = in.readLine()
					println("Here message: " + message)

					out.println("I got your message")

					out.close()
					in.close()
					socket.close()

					listener.close()
				} catch {
				case e: IOException =>
				System.err.println("Could not listen on port: 9999.");
				System.exit(-1)
				}
	}
}