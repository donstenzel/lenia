# Experimental!

# padded ? pad-size array
Pad ← ⌝↘¯⟜⌝↘

# bell ? μ σ x
B ← ⁿ⊙e¯÷⟜ⁿ2÷𝄐⌞-

# pads both ends with n elements of the other end
# padded ? n list
WF ← ⊂⊂⊃(↙¯)⊃⋅∘↙

# world ? kernel world
~Conv {K} ⧈(/+♭×K) △K

# σ ? x
SoftMax ← ÷⤚+1ⁿ⊙e×₋₆

# continuous life like cellular automaton
┌─╴Lenia
  # kernel ? R β
  Kernel ← memo(
    ×◡⋅⧻÷⟜(⌵≡₂/ℂ-|⊞⊟.⇡+₁×₂)
    ××⊃(>⊙⧻|⊏↧⊸⊓⌊(-₁⧻)|B 0.5 0.15 ◿₁)
    ÷/+⊸♭
  )
  
  # world ? T R μ σ β world
  ~U {T R μ σ β} ↥₀↧₁ +⊸(
      WF R ≡WF R
      wait≡pool◇(Conv Kernel) R β ¤
      ÷T ÷⧻⟜/+ ≡(-₁ ×₂ B) μ σ
    )
  
  ~Sim {f T R μ σ β} ⇌[⍥⊸(U T R μ σ β)-₁f]
└─╴

┌─╴Asymptotic
  Kernel ← Lenia~Kernel
  # world ? T R μ σ β world
  ~U {T R μ σ β} ↥₀↧₁ +⟜(
      ÷T ÷⧻⟜/+ -⌞
    | WF R ≡WF R
      wait≡pool◇(Conv Kernel) R β ¤
      ≡B μ σ
    )
  
  ~Sim {f T R μ σ β} ⇌[⍥⊸(U T R μ σ β)-₁f]
└─╴

┌─╴MultiChannel
  # kernel ? R ρ β
  Kernel ← memo(
    ×◡⋅⧻÷:÷⟜(⌵≡₂/ℂ-|⊞⊟.⇡+₁×₂)
    ××⊃(>⊙⧻|⊏↧⊸⊓⌊(-₁⧻)|B 0.5 0.15 ◿₁)
    ÷/+⊸♭
  )
  
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁} ↥₀↧₁ +⟜(
      ⊏C₀ ≡(WF R ≡WF R)
      wait≡pool◇(Conv Kernel) R ρ β
      ≡(-₁ ×₂ B) μ σ
      ÷T ⊕/+C₁ ×H
    )
  
  ~Sim {f T R μ σ β ρ H C₀ C₁} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f]
  
  Vis ← ≡(▽⟜≡▽ 4 ⍉)
└─╴

┌─╴AsymptoticMulti
  Kernel ← MultiChannel~Kernel
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁} ↥₀↧₁ +⟜(
      ⨬(-₁⋅×₂|-₁⋅×₂|-)⟜⊏C₁
      ÷T ⊕/+C₁ ×H
    | ⊏C₀ ≡(WF R ≡WF R)
      wait≡pool◇(Conv Kernel) R ρ β
      ≡B μ σ)
  
  ~Sim {f T R μ σ β ρ H C₀ C₁} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f]
└─╴

┌─╴Viridis
  B   ← ÷₂₅₅[68 1 84]
  G   ← ÷₂₅₅[33 145 140]
  Y   ← ÷₂₅₅[253 231 37]
  New ← B G Y
└─╴

┌─╴Magma
  B   ← ÷₂₅₅[0 0 4]
  M   ← ÷₂₅₅[183 55 121]
  C   ← ÷₂₅₅[252 253 191]
  New ← B M C
└─╴

┌─╴Plasma
  B   ← ÷₂₅₅[12 8 135]
  M   ← ÷₂₅₅[204 71 120]
  Y   ← ÷₂₅₅[240 249 33]
  New ← B M Y
└─╴

# linear interpolation
# ? a b x
L ← +⊙×⟜-

# color ? empty low high progress
~C {Empty Low High} ⨬(
    L Empty Low ×₂
  | L Low High -₁ ×₂
  )⊸≥0.5

# applies colormap and upscales each frame
# colored ? empty low high grayscale
D ← wait≡pool(▽⟜≡▽4 C)∩₃¤
