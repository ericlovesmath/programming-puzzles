Solution ← (
  ⊙⟜∘               # Duplicate edges list
  ˜∧(⍜⊡(+1))˙⊞=⇡    # Construct adjacency matrix
  ±↥⟜⍉              # Make adj matrix bidirectional
  ⟜(⇡⧻)             # Label 0 to n-1
  ⍥(⟜(≡(/↧▽)⊙¤))⊸⧻  # Set label to min of nbhrs (n times)
  ◌                 # Remove edges
  ⟜˜(⊏≡⊢)           # Each edge's component label
  ⊃(≡/+⊞=⊸◴|≡/+⊞=◴) # Num verticies in distinct component
  /+=⊙(×2)×⟜(-1)    # Count outdegree to check complete
)

⍤ "Test 1" = 3 Solution 6 [0_1 0_2 1_2 3_4]
⍤ "Test 2" = 1 Solution 6 [0_1 0_2 1_2 3_4 3_5]
