# Experimental!

Viridis ← ÷₂₅₅[[68 1 84]
               [33 145 140]
               [253 231 37]]

Magma ← ÷₂₅₅[[0 0 4]
             [183 55 121]
             [252 253 191]]

Plasma ← ÷₂₅₅[[12 8 135]
              [204 71 120]
              [240 249 33]]

# Colors a grayscale image using a segmented
# colormap, which should be an array of colors.
# Check out `Viridis` for an example.
# colored ? colormap grayscale
C ← ⍜-× ⊃(⍜⊟⊏⊃⌊⌈)◿₁ ×-₁⤚⊓⧻∘

Grid  ← ⌵˙⊞ℂ-⊃÷₂⇡
Shift ← ↻⌈÷₂⊸△
Conv  ← ×√/×⊸△ ◌°ℂ ⍜∩fft×

# bell ? x μ σ
Bell ← ⁿ⊙e¯÷⟜ⁿ2˜÷˜-

# image radius ? factor image radius
Scale ← ⊓⌞(▽⟜≡▽|×)

# The single channel version is only black & white
# so you can use C to color it with any segmented
# colormap like Viridis. States, space and time
# are continuous.
┌─╴Single
  # kernel ? R Ws β
  Kernel ← memo(
    ×◡⋅⧻ ÷⊙Grid
    ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
    Shift ÷/+⊸♭
  )

  # The parameters are as follows:
  #  - W ← the world state (must be a square grid)
  #  - T ← time scale
  #  - R ← kernel radius
  #  - β ← kernel peaks
  #  - μ, σ ← growth center & -width
  # W ? W R β μ σ T
  U ← ↥₀↧₁ +⟜(
    ⊃⤙⊓⧻◌𝄐˜⊙¤
    ≡(Conv◇Kernel)
    ÷⊃(×⧻|/+) -₁×₂Bell
  )

  # The parameters are as follows:
  #  - W ← the world state (must be a square grid)
  #  - T ← time scale
  #  - R ← kernel radius
  #  - β ← kernel peaks
  #  - μ, σ ← growth center & -width
  # anim ? frames W R β μ σ T
  Sim ← ⍥⤚⊸₅U
└─╴

# In the multi channel version, the output is
# inherently colored.
┌─╴Multi
  # Ws R ρ β
  Kernel ← memo(
    ×◡⋅⧻ ÷⊃⋅×Grid
    ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
    Shift ÷/+⊸♭
  )

  # The parameters are as follows:
  #  - Cs ← channels = current state
  #  - C₀ ← input channel indeces
  #  - T ← time scale
  #  - R ← kernel radius
  #  - ρ ← relative kernel radius
  #  - β ← kernel peaks
  #  - μ, σ, H ← growth centers, -widths & -heights
  #  - C₁ ← output channel indeces
  # Cs ? Cs C₀ R ρ β μ σ H C₁ T
  U ← ↥₀↧₁ +⟜(
    ⧻⤚⊓⊢⊙⊙∘˜⊏
    ≡(Conv◇Kernel)
    ˜÷˜⊕/+×-₁×₂Bell
  )

  # The parameters are as follows:
  #  - Cs ← channels = current state
  #  - C₀ ← input channel indeces
  #  - T ← time scale
  #  - R ← kernel radius
  #  - ρ ← relative kernel radius
  #  - β ← kernel peaks
  #  - μ, σ, H ← growth centers, -widths & -heights
  #  - C₁ ← output channel indeces
  # anim ? frames Cs C₀ R ρ β μ σ H C₁ T
  Sim ← ⍥⊃⊸₉U⍉
└─╴
