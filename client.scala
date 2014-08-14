import java.io._
import java.net.{ InetAddress, Socket, SocketException }

object MyClient {
	def main(args: Array[String]) {
		if (args.length < 2) {
			printf("scala MyClient hostname port");
			return;
		}

		val host = args(0);
		val port: Int = args(1).toInt;

		try {
			val ia = InetAddress.getByName(host);
			val socket = new Socket(ia, port);
			val out = new PrintWriter(socket.getOutputStream());
			val in = new DataInputStream(socket.getInputStream());

			val message = readLine();
			out.println(message);
			out.flush();

			val receipt = in.readLine();
			println(receipt);

			out.close();
			in.close();
			socket.close();
		} catch {
		case e: IOException =>
		e.printStackTrace();
		}
	}
}