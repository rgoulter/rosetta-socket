import Network.Socket
import System.Environment
import System.IO

main = do
    [hostname, port] <- getArgs
    sockfd <- socket AF_INET Stream defaultProtocol
    addrInfos <- getAddrInfo (Just defaultHints { addrFamily = AF_INET
                                                , addrSocketType = Stream
                                                })
                             (Just hostname)
                             (Just port)
    let sockAddr = addrAddress $ head addrInfos
    connect sockfd sockAddr
    putStr "Please enter the message: "
    hFlush stdout -- need this, otherwise doesn't flush. :/
    message <- getLine
    numBytesSent <- send sockfd message
    messageFromServer <- recv sockfd 256
    putStrLn messageFromServer
    close sockfd
