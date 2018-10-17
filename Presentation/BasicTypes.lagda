\begin{code}
module Presentation.BasicTypes where

open import Data.Nat hiding (_+_)
module Streams where
\end{code}
%<*stream>
\begin{code}
  record Stream (A : Set) : Set where
    coinductive
    field
      head  : A
      tail  : Stream A
\end{code}
%</stream>
%<*plus-def>
\begin{code}
_+_ : ℕ → ℕ → ℕ
0 + y = y
suc x + y = suc (x + y)
\end{code}
%</plus-def>
%<*xint>
\begin{code}
x : ℕ
\end{code}
%</xint>
%<*xprf>
\begin{code}
x = 1
\end{code}
%</xprf>
\begin{code}
open import Data.List hiding (length; head; reverse)

pattern 1+ x = suc x
\end{code}
%<*fib>
\begin{code}
fib : ℕ → ℕ
fib 0            = 0
fib (1+ 0)       = 1+ 0
fib (1+ (1+ n))  = fib (1+ n) + fib n
\end{code}
%</fib>
%<*length>
\begin{code}
length : {A : Set} → List A → ℕ
length [] = 0
length (x ∷ xs) = 1 + length xs
\end{code}
%</length>
\begin{code}
{-# TERMINATING #-}
\end{code}
%<*headty>
\begin{code}
head : {A : Set} → List A → A
\end{code}
%</headty>
%<*head1>
\begin{code}
head (x ∷ xs) = x
\end{code}
%</head1>
%<*head2>
\begin{code}
head [] = head []
\end{code}
%</head2>
%<*bot-def>
\begin{code}
data ⊥ : Set where
\end{code}
%</bot-def>
\begin{code}
module BadNeg where
\end{code}
%<*false>
\begin{code}
  ¬ : ∀ {ℓ} → Set ℓ → Set _
  ¬ A = A → {B : Set} → B
\end{code}
%</false>
%<*head-not>
\begin{code}
  head-doesn't-exist : ¬ ({A : Set} → List A → A)
  head-doesn't-exist head = head []
\end{code}
%</head-not>
%<*poe-to-bot>
\begin{code}
  law-of-non-contradiction : ∀ {a} {A : Set a} → ¬ A → A → ⊥
  law-of-non-contradiction f x = f x
\end{code}
%</poe-to-bot>
%<*bot-to-poe>
\begin{code}
  not-false : ¬ ⊥
  not-false ()
\end{code}
%</bot-to-poe>
\begin{code}
¬_ : Set → Set
¬ A = A → ⊥
module ProofSigs where
  open import Relation.Binary.PropositionalEquality
  reverse : ℕ → ℕ
  reverse x = x
\end{code}
%<*reverse-props>
\begin{code}
  reverse-involution : ∀ xs → reverse (reverse xs) ≡ xs
\end{code}
%</reverse-props>
\begin{code}
  reverse-involution xs = refl
\end{code}
%<*bool-def>
\begin{code}
data Bool : Set where
  true   : Bool
  false  : Bool
\end{code}
%</bool-def>
%<*top-def>
\begin{code}
data ⊤ : Set where
  tt : ⊤
\end{code}
%</top-def>
\begin{code}
module Impl where
  data A : Set where
  data B : Set where
  implication :
\end{code}
%<*impl>
\begin{code}
    A → B
\end{code}
%</impl>
\begin{code}
  implication ()
\end{code}
\begin{code}
module DataProduct where
\end{code}
%<*prod>
\begin{code}
  data _×_ (A B : Set) : Set where
    _,_ : A → B → A × B
\end{code}
%</prod>
\begin{code}
module RecordProduct where
\end{code}
%<*prod-record>
\begin{code}
  record _×_ (A B : Set) : Set where
    constructor _,_
    field
      fst  : A
      snd  : B
\end{code}
%</prod-record>
\begin{code}
  open _×_
\end{code}
%<*cnj-elim>
\begin{code}
  cnj-elim : ∀ {A B} → A × B → A
  cnj-elim = fst
\end{code}
%</cnj-elim>
%<*curry>
\begin{code}
  curry : {A B C : Set} → (A × B → C) → A → (B → C)
  curry f x y = f (x , y)
\end{code}
%</curry>
%<*disj>
\begin{code}
data _∪_ (A B : Set) : Set where
  inl  : A  → A ∪ B
  inr  : B  → A ∪ B
\end{code}
%</disj>
%<*pi-example>
\begin{code}
prop : (x : ℕ) → 0 ≤ x
\end{code}
%</pi-example>
\begin{code}
prop _ = z≤n
\end{code}
%<*sigma-example>
\begin{code}
record NonZero : Set where
  field
    n      : ℕ
    proof  : 0 < n
\end{code}
%</sigma-example>
%<*eq-example>
\begin{code}
infix 4 _≡_
data _≡_ {A : Set} (x : A) : A → Set where
  refl : x ≡ x
\end{code}
%</eq-example>
%<*plus-obvious>
\begin{code}
obvious : ∀ x → 0 + x ≡ x
obvious _ = refl
\end{code}
%</plus-obvious>
%<*plus-not-obvious>
\begin{code}
cong : ∀ {A B} → (f : A → B) → ∀ {x y} → x ≡ y → f x ≡ f y
cong _ refl = refl

not-obvious : ∀ x → x + 0 ≡ x
not-obvious zero = refl
not-obvious (suc x) = cong suc (not-obvious x)
\end{code}
%</plus-not-obvious>
%<*lem>
\begin{code}
postulate LEM : (A : Set) → A ∪ (¬ A)
\end{code}
%</lem>
%<*ext>
\begin{code}
postulate function-extensionality
            : {A B : Set} {f g : A → B}
            → (∀ x → f x ≡ g x)
            → f ≡ g
\end{code}
%</ext>
