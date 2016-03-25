module Desktop (Group, Entry, Key, Value, runDesktopFile, desktopParser) where

{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative (many, (<|>), empty)
import Data.Map (Map, (!))
import qualified Data.Map as M
import Data.Text (pack)
import Text.Parsec (Parsec, skipMany)
import Text.Parsec.Char (char, oneOf, noneOf, endOfLine)
import Text.Parsec.Combinator (optional, between, sepBy, endBy)
import Text.Parsec.Prim (token)
import Text.Parsec.String (Parser, parseFromFile)
import Turtle (shell)

type Key = String
type Value = String
type Entry = (Key, Value)
data Group = MkGroup { header :: String, entries :: [Entry] }
  deriving (Show, Eq, Ord)

commentLine :: Parser ()
commentLine = optional (char '#' *> many (noneOf "\n"))

groupHeaderParser :: Parser String
groupHeaderParser =
  between (char '[') (char ']') (many (noneOf "[]")) <* endOfLine

keyParser :: Parser Key
keyParser = many (oneOf $ ['A' .. 'Z'] ++ ['a' .. 'z'] ++ ['0' .. '9'] ++ "-")

escapes :: Map Char Char
escapes = M.fromList
  [ ('s', ' ')
  , ('n', '\n')
  , ('t', '\t')
  , ('r', '\r')
  , ('\\', '\\')
  ]

valueEscapeParser :: Parser Char
valueEscapeParser = do
  char '\\'
  c <- oneOf (M.keys escapes)
  return (escapes ! c)

valueCharParser :: Parser Char
valueCharParser = valueEscapeParser <|> noneOf "\\\n"

valueParser :: Parser Value
valueParser = many valueCharParser

entryParser :: Parser Entry
entryParser = do
  key <- keyParser
  skipMany (oneOf " \t")
  char '='
  skipMany (oneOf " \t")
  value <- valueParser
  return (key, value)

groupParser :: Parser Group
groupParser = do
  sepBy commentLine endOfLine
  header <- groupHeaderParser
  entries <- endBy entryParser endOfLine
  return (MkGroup header entries)

desktopParser :: Parser [Group]
desktopParser = many groupParser <* sepBy commentLine endOfLine

runDesktopFile :: FilePath -> String -> IO Bool
runDesktopFile file header = do
  r <- parseFromFile desktopParser file
  case r of
    Left _ -> return False
    Right ds ->
      let f (MkGroup h es) acc =
           case M.lookup "Exec" (M.fromList es) of
             Nothing -> acc
             Just c -> M.insert h c acc
      in
      let commands = foldr f M.empty ds in
      case M.lookup header commands of
        Nothing -> return False
        Just c -> do
          shell (pack c) empty
          return True
