# evil-commentary

[evil-commentary] is intended to be a port of [vim-commentary].

> Use <kbd>gcc</kbd> to comment out a line (takes a count),
> <kbd>gc</kbd> to comment out the target of a motion (for example,
> <kbd>gcap</kbd> to comment out a paragraph), <kbd>gc</kbd> in visual
> mode to comment out the selection.

I wrote this because of that I really admire the work of [tpope] the
author of [vim-commentary] and want to have something really simple
(less than 100 lines) like he did with his [vim-commentary].

## Install
The easiest way to install `evil-commentary` is by `package.el`
through melpa [melpa](http://melpa.milkbox.net/#/getting-started) then
try it with

```lisp
M-x evil-commentary-default-setup
```

To enable `evil-commentary` permanently, add

```lisp
(evil-commentary-default-setup)
```

to your `init.el`.

Or anually clone [evil-commentary] to your `loadpath` and add those
line to `init.el`

```lisp
(add-to-list 'load-path "/path/to/evil-commentary")
(require 'evil-commentary)
(evil-commentary-default-setup)
```

## Default setups

The default setups will enable the `operator` `evil-commentary` to
<kbd>gc</kbd>. That means we will be free to use it with any available
`motions` and `arguments`. <kbd>gcc</kbd> does also work as
expected. Try <kbd>gcap</kbd> to comment out a paragraph or to
uncomment a paragraph that is already commented
out. `:g/TODO/evil-commentary` can be used to toggle comments on all
lines that contain the string "TODO".

I also bind <kbd>super</kbd>+<kbd>/</kbd> as an stand-alone defacto
default key binding in most text-editor. It's should work in `emacs`
and `insert` state too. (Evil is however still required.)

## Custom mappings
You're free to map `evil-commentary` and `evil-commentary-line` to
anything you want. If you find that <kbd>,cc</kbd> is more
elegant/convenience, consider having a look on [evil-space] to keep
`evil-repeat-find-char` functional...

The autoload functions are, however, not enable by defaut apart from
`evil-commentary-default-setup` to prevent `evil` from `autoload`. To
customize keys, consider add something like this into `init.el`.

```lisp
(eval-after-load 'diff-mode
  '(progn
	(require 'evil-commentary)
	(define-key 'evil-normal-state-map ",c" evil-commentary)))
```

[evil-commentary]: https://github.com/linktohack/evil-commentary
[evil-mode]: https://gitorious.org/evil/pages/Home
[vim-commentary]: https://github.com/tpope/vim-commentary
[tpope]: https://github.com/tpope
[evil-space]: https://github.com/linktohack/evil-space
