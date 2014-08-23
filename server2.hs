import Network
import System.Environment
import System.IO

main = withSocketsDo $ do
    [port] <- getArgs
    let portNum = PortNumber . fromIntegral $ read port
    sock <- listenOn portNum
    (clienth, clientHost, clientPort) <- accept sock
    clientMessage <- hGetLine clienth
    putStr "Here is the message: "
    putStrLn clientMessage
    hPutStr clienth "I got your message"
    hClose clienth
    sClose sock
