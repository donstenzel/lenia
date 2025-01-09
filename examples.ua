# Experimental!
L ~ "lenia"
C ~ "creatures"

# padded ? mat mult
Pad ← ⊙◌⍥(⍉⌝↻-∩(⌈÷₂)⊸⊃⊓⧻∘⬚0⍜⧻◌) ⊃(⧻△|∘|⁅×/↥△)

# [creature] ? scale [creature] padding
Scale₆ ← 𝄐⌞𝄐⌞𝄐⌞𝄐⌞𝄐⌞(Pad ▽⟜≡▽)⟜𝄐⌞×
# [mc creature] ? scale [mc creature] padding
Scale₁₀ ← 𝄐⌞𝄐⌞𝄐⌞𝄐⌞𝄐⌞𝄐⌞𝄐⌞𝄐⌞𝄐⌞≡(Pad ▽⟜≡▽)⟜𝄐⌞×

SmoothLife  ← 1 10 ¤0.31 ¤0.049 ¤¤1 ×⊸≥0.7 gen 128_128
CloseMinded ← 1 2 ¤0.35 ¤0.07 ¤¤1 ⁅ gen 128_128
Lenia       ← 10 10 ¤0.15 ¤0.015 ¤¤1 gen 64_64
Eerie       ← 10 80 [0.15] [0.015] {[1 2]} ▽⟜≡▽8 gen 64_64
