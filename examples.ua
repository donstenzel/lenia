# Experimental!
L ~ "lenia"
C ~ "creatures"
R ~ "git: https://github.com/donstenzel/raylib-uiua"
  W  ← R~Window
  Kb ← R~Keyboard

SmoothLife  ← ×⊸≥0.7 gen 128_128 ⊙(10 1 0.31 0.049 1)
CloseMinded ← gen 128_128 ⊙(2 1 0.35 0.07 1)
Lenia       ← gen 64_64 ⊙(10 1 0.15 0.015 10)
Eerie       ← ▽⟜≡▽ 8 gen 64_64 ⊙(80 {[1 2]} 0.15 0.015 10)

X ← 1024
Y ← 1024

W X Y "Rayua Lenia"
°W~FPS 30
Kb~Exit @q

# ▽⟜≡▽2 gen ÷8X_Y ⚂ 20 1 0.15 0.015 5
L~Scale 4 C~Pad 22_22 C~Orbium

◌ W~Loop!L!(
  ⊃(▽⟜≡▽4 C Viridis|Single~U)
  R~ShowArray
)
