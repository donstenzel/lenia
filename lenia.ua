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

# linear interpolation
# ? a b x
L ← +⊙×⟜-

# colored ? grayscale colors
C ← L ∩⌟⊏ ⊙⊙: ⨬(
  0 1 ×₂
| 1 2 -₁ ×₂
)⊸⁅

# bell ? μ σ x
B ← ⁿ⊙e¯÷⟜ⁿ2÷𝄐⌞-

┌─╴Slow
  # pads both ends with n elements of the other end
  # padded ? n list
  WF ← ⊂⊂⊃(↙¯)⊃⋅∘↙
  
  # world ? kernel world
  ~Conv {K} ⧈(/+♭×K) △K
  
  # continuous life like cellular automaton
  ┌─╴Lenia
    # kernel ? R β
    Kernel ← (
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
    Kernel ← (
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
└─╴

# freq ? time
FFT ← ⌅(⍥(⍉fft)⧻⊸△|⍥°(⍉fft)⧻⊸△)

# shifted ? reg
FFTShift ← ⍥(⍉⊂⊃↘↙⌈÷₂⊸⧻)⧻⊸△

Conv ← ×√/×⊸△ ⍜∩FFT×

Real ← ◌°ℂ

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
      wait≡pool◇(Real Conv Kernel)
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
      wait≡pool◇(Real Conv Kernel)
      ≡B μ σ
    )
  
  ~Sim {f T R μ σ β} ⇌[⍥⊸(U T R μ σ β)-₁f]
└─╴

┌─╴Multi
  # kernel ? R Ws ρ β
  Kernel ← (
    ×◡⋅⧻÷:÷⊙(⌵≡₂/ℂ -÷₂⊸⧻ ⊞⊟.⇡)
    ××⊃(>⊙⧻|⊏↧⊸⊓⌊(-₁⧻)|B 0.5 0.15 ◿₁)
    FFTShift ÷/+⊸♭
  )
  
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁} ↥₀↧₁ +⟜(
      ⊃(R|≡⧻|ρ|β|∘) ⊏C₀
      wait≡pool(Real Conv ◇Kernel)
      ≡(-₁ ×₂ B) μ σ
      ÷T ⊕/+C₁ ×H
    )
  
  ~Sim {f T R μ σ β ρ H C₀ C₁} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f]
└─╴

┌─╴AMC
  # kernel ? R Ws ρ β
  Kernel ← Multi~Kernel
  
  # world ? T R μ σ β world
  ~U {T R μ σ β ρ H C₀ C₁} ↥₀↧₁ +⟜(
      ⨬(-₁⋅×₂|-₁⋅×₂|-)⟜⊏C₁
      ÷T ⊕/+C₁ ×H
    | ⊃(R|≡⧻|ρ|β|∘) ⊏C₀
      wait≡pool(Real Conv ◇Kernel)
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
      wait≡pool(Real Conv ◇Kernel)
      ≡B μ σ)
  
  ~Sim {f T R μ σ β ρ H C₀ C₁} ⇌[⍥⊸(U T R μ σ β ρ H C₀ C₁)-₁f]
└─╴

# applies colormap and upscales each frame
# colored ? grayscale colormap
GifReg ← wait≡⌟pool(▽⟜≡▽4 C)
# transposes and upscales multi channel frames
GifMC ← ≡(▽⟜≡▽4 ⍉)
