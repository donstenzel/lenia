# Lenia

Lenia is a space, state and time continuous cellular automaton.

This is an implementation of it in [Uiua](https://uiua.org)!

Check out [this website](https://chakazul.github.io/lenia.html) for further
reading on Lenia. This page also served as my main source of information.

You can find a jupyter notebook called "From Conway to Lenia" on there,
which was great to follow along.

Unfortunately, this implementation is not very fast. There is some
optimization involving Fourier Transformation and regular multiplication
instead of convolution, but I have never used FT before so it's going
to take a while until I understand it enough.

![Lenia](visualizations/lenia.gif)

![Orbium](visualizations/orbium.gif)