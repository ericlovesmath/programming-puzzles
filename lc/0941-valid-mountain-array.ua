Sol ← (
  ±≡/-⧈∘2           # Sign of height differences
  ×⊃(≍⇌⊸⍆)(≍[1¯1]◴) # No rise after fall OR goes up/down
)

⍤ "Test 1" ¬ Sol [2 1]
⍤ "Test 2" ¬ Sol [3 5 5]
⍤ "Test 3" Sol [0 3 2 1]
