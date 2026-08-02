{-# OPTIONS_GHC -Wno-x-partial #-}

import Data.List (nub, partition, sort)

solution :: [[String]] -> [[String]]
solution = foldr add []
  where
    add [] gs = gs
    add (n : es) gs = (n : sort (nub (es <> (hit >>= tail)))) : miss
      where
        (hit, miss) = partition (any (`elem` es) . tail) gs

main :: IO ()
main = do
  print $
    solution
      [ ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
        ["John", "johnsmith@mail.com", "john00@mail.com"],
        ["Mary", "mary@mail.com"],
        ["John", "johnnybravo@mail.com"]
      ]
  print $
    solution
      [ ["Gabe", "Gabe0@m.co", "Gabe3@m.co", "Gabe1@m.co"],
        ["Kevin", "Kevin3@m.co", "Kevin5@m.co", "Kevin0@m.co"],
        ["Ethan", "Ethan5@m.co", "Ethan4@m.co", "Ethan0@m.co"],
        ["Hanzo", "Hanzo3@m.co", "Hanzo1@m.co", "Hanzo0@m.co"],
        ["Fern", "Fern5@m.co", "Fern1@m.co", "Fern0@m.co"]
      ]
