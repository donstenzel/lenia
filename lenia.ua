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

# colored ? grayscale colormap
C ← ⍜-× ⊃(⍜⊟⊏⊃⌊⌈)◿₁ ×-₁◡⋅⧻

# bell ? μ σ x
B ← ⁿ⊙e¯÷⟜ⁿ2÷𝄐⌞-

Grid ← ⌵-ℂ. ÷₂⊸⧻ ⊞ℂ.⇡

# applies F once for each dimension
RP! ← ⍥(⍉^0)⧻⊸△

FFT ← ⌅(RP!fft|RP!°fft)

FFTShift ← RP!(⊂⊃↘↙⌈÷₂⊸⧻)

Conv ← ×√/×⊸△ ◌°ℂ ⍜∩FFT×

┌─╴Lenia
  # kernel ? R Ws β
  Kernel ← (
    ×◡⋅⧻÷⊙(⌵≡₂/ℂ -÷₂⊸⧻ ⊞⊟.⇡)
    ××⊃(>⊙⧻|⊏↧⊸⊓⌊(-₁⧻)|B 0.5 0.15 ◿₁)
    FFTShift ÷/+⊸♭
  )
  
  # world ? T R μ σ β world
  ~U {T R μ σ β} ↥₀↧₁ +⟜(
      ⊃(R|⧻|β|¤)
      wait≡pool◇(Conv Kernel)
      ÷T ÷⧻⟜/+ ≡(-₁ ×₂ B) μ σ
    )
  
  ~Sim {f T R μ σ β} ⇌[⍥⊸(U T R μ σ β)-₁f]
└─╴

┌─╴Asymptotic
  # kernel ? R Ws β
  Kernel ← Lenia~Kernel
  
  # world ? T R μ σ β world
  ~U {T R μ σ β} ↥₀↧₁ +⟜(
      ÷T ÷⧻⟜/+ -⌞
    | ⊃(R|⧻|β|¤)
      wait≡pool◇(Conv Kernel)
      B μ σ
    )
  
  ~Sim {f T R μ σ β} ⇌[⍥⊸(U T R μ σ β)-₁f]
└─╴

┌─╴Multi
  # kernel ? R Ws ρ β
  Kernel ← (
    ×◡⋅⧻ ÷⊃𝄐×⋅Grid
    ××⊃(>⊙⧻|⊏↧⊸⊓⌊(-₁⧻)|B 0.5 0.15 ◿₁)
    FFTShift ÷/+⊸♭
  )
  
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁ W} ↥₀↧₁ +⟜(
      ⊃(R|≡⧻|ρ|β|∘) ⊏C₀
      wait≡pool(Conv ◇Kernel)
      -₁ ×₂ B μ σ
      ÷T ⊕/+C₁ ×H
    ) W
  
  ~Sim {f T R μ σ β ρ H C₀ C₁ W} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f W]
└─╴

┌─╴AMC
  # kernel ? R Ws ρ β
  Kernel ← Multi~Kernel
  
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁} ↥₀↧₁ +⟜(
      ⨬(-₁⋅×₂|-₁⋅×₂|-)⟜⊏C₁
      ÷T ⊕/+C₁ ×H
    | ⊃(R|≡⧻|ρ|β|∘) ⊏C₀
      wait≡pool(Conv ◇Kernel)
      ≡B μ σ)
  
  ~Sim {f T R μ σ β ρ H C₀ C₁} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f]
└─╴

# σ ? x
SoftMax ← ÷⤚+1ⁿ⊙e×₋₄-0.5

┌─╴SoftMaxAMC
  # kernel ? R Ws ρ β
  Kernel ← Multi~Kernel
  
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁} SoftMax +⟜(
      ⨬(-₁⋅×₂|-₁⋅×₂|-)⟜⊏C₁
      ÷T ⊕/+C₁ ×H
    | ⊃(R|≡⧻|ρ|β|∘) ⊏C₀
      wait≡pool(Conv ◇Kernel)
      B μ σ)
  
  ~Sim {f T R μ σ β ρ H C₀ C₁} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f]
└─╴

# Tacit
┌─╴Tacit
  # bell ? x μ σ
  Bell ← ⁿ⊙e¯÷⟜ⁿ2˜÷˜-
  
  # image radius ? factor image radius
  Scale ← ⊓⌞(▽⟜≡▽|×)
  
  ┌─╴Lenia
    # kernel ? R Ws β
    Kernel ← memo(
      ×◡⋅⧻ ÷⊙Grid
      ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
      FFTShift ÷/+⊸♭
    )
    
    # W ? W R β μ σ T
    U ← ↥₀↧₁ +⟜(
      ⊃(⋅∘|⧻|⋅⋅∘|¤)
      ≡(Conv◇Kernel)
      ÷⊃(×⧻|/+) -₁×₂Bell
    )
    
    # anim ? frames W R β μ σ T
    Sim ← ⇌[∩₆◌ ⍥⤚⊸₅U]
  └─╴
  
  ┌─╴Multi
    # Ws R ρ β
    Kernel ← memo(
      ×◡⋅⧻ ÷⊃⋅×Grid
      ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
      FFTShift ÷/+⊸♭
    )
    
    # Cs ? Cs C₀ R ρ β μ σ H C₁ T
    U ← ↥₀↧₁ +⟜(
      ⧻⤚⊓⊢⊙⊙∘˜⊏
      ≡(Conv◇Kernel)
      ˜÷˜⊕/+×-₁×₂Bell
    )
    
    # anim ? frames Cs C₀ R ρ β μ σ H C₁ T
    Sim ← ⇌[∩₁₀◌ ⍥⊃⊸₉U⍉]
  └─╴
└─╴
