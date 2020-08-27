module Main where

{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy.Char8 as L8
import Network.HTTP.Simple

main :: IO ()
main = do
    request <- parseRequest "GET https://codingteam.org.ru/"
    response <- httpLBS request

    putStrLn $ "Status code: " ++ show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response
