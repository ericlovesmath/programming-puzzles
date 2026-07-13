import Control.Monad.State (evalState, state)

newtype StockSpanner = StockSpanner [(Int, Int)]

newSpanner :: StockSpanner
newSpanner = StockSpanner []

next :: Int -> StockSpanner -> (Int, StockSpanner)
next price (StockSpanner stack) = (s, StockSpanner ((price, s) : rest))
  where
    (popped, rest) = span ((<= price) . fst) stack
    s = 1 + sum (map snd popped)

-- Thread one spanner through a list of prices and collect spans
spans :: [Int] -> [Int]
spans = flip evalState newSpanner . traverse (state . next)

main :: IO ()
main = print $ spans [100, 80, 60, 70, 60, 75, 85]
