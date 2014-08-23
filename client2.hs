import Network
import System.Environment
import System.IO

main = withSocketsDo $ do
    [hostname, port] <- getArgs
    let portNum = PortNumber . fromIntegral $ read port
    sockh <- connectTo hostname portNum
    putStr "Please enter the message: "
    hFlush stdout -- need this, otherwise doesn't flush. :/
    message <- getLine
    hPutStr sockh message
    messageFromServer <- hGetLine sockh
    putStrLn messageFromServer
    hClose sockh
