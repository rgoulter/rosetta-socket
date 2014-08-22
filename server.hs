import Network
import System.Environment
import System.IO

main = withSockets $ do
    [port] <- getArgs
    sockh <- connectTo 

    sockfd <- socket AF_INET Stream defaultProtocol
    addrInfos <- getAddrInfo (Just defaultHints { addrFamily = AF_INET
                                                , addrSocketType = Stream
                                                })
                             Nothing -- defaults to iNADDR_ANY
                             (Just port)
    let sockAddr = addrAddress $ head addrInfos
    bind sockfd sockAddr
    listen sockfd 5
    (clientSock,  clientAddr) <- accept sockfd
    clientMessage <- recv clientSock 256
    putStr "Here is the message: "
    putStrLn clientMessage
    numBytesSent <- send clientSock "I got your message"
    close clientSock
    close sockfd
