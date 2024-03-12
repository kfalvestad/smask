{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.ByteString as B
import Network.Simple.TCP

cr :: B.ByteString
cr = "\r"

lf :: B.ByteString
lf = "\n"

space :: B.ByteString
space = "%20"

buildRequest :: B.ByteString -> B.ByteString
buildRequest s = s `B.append` space `B.append` cr `B.append` lf

main :: IO ()
main =
  do
    connect "geminiquickst.art" "1965" $ \(connectionSocket, remoteAddr) ->
      do
        putStrLn $ "Connection established to " ++ show remoteAddr

{-         send connectionSocket $ buildRequest "gemini://geminiquickst.art"
        response <- recv connectionSocket 4096
        case response of
          Just x -> B.putStr x
          Nothing -> putStrLn "Remote end closed the connection or end-of-input was reached" -}
