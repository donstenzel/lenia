# Lenia
Lenia is a space, state and time continuous cellular automaton.

This is an implementation of it in [Uiua](https://uiua.org)!

Check out [this website](https://chakazul.github.io/lenia.html) for further
reading on Lenia. This page also served as my main source of information.

You can find a jupyter notebook called "From Conway to Lenia" on there,
which was great to follow along.

~~Unfortunately, this implementation is not very fast. There is some
optimization involving Fourier Transformation and regular multiplication
instead of convolution, but I have never used FT before so it's going
to take a while until I understand it enough.~~

I've implemented the fast fourier transform convolution, which is an
immense upgrade. For reference, my biggest render before took 82 minutes.
With FFT it only takes ~75s! Maybe I will look into rayua to create some
live visualizations, since it's a lot more feasable now.

# Showcase 📷

## Lenia
This is classic Lenia, showcasing continuous states, time and space.

![Lenia](visualizations/lenia.gif)

## Orbium
The Orbium was one of the first creatures to be found inside Lenia.

![Orbium](visualizations/orbium.gif)

## Wanderer
The Wanderer is produced using asymptotic growth. This makes the creature
smoother and more defined.

![Wanderer](visualizations/wanderer.gif)

## Smooth glider spawner
This creature lives in the multi-channel extension to Lenia, where
kernels have different input and output channels, producing an even
more elaborate result.

![Emitter](visualizations/emitter.gif)

## Tesselatium gyrans
This species also lives in multi-channel Lenia, and manifests in multiple
different forms.

![Tesselatium gyrans](visualizations/tesselatium-gyrans.gif)

These renders of Tesselatium gyrans clearly demonstrate that
creatures in Lenia can possess cohesion and rigidity in their structure.
Even when meeting one another, they simply bounce. They also show swarm
behaviour when moving side by side.

![Cohesion](visualizations/cohesion.gif)

# Final words
I find it truly fascinating to see how complex structures like these can
arise from relatively simple rules.

Writing the code for this was actually really simple. Once I had wrapped my head
around what we're trying to do, implementing it in Uiua was a breeze. It really
excels at working with lots of inputs in parallel. In particular, implementing
further 'upgrades' like multiple rings in the kernel, multiple kernels and
multiple channels were all easily done.