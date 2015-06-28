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

The easiest way to install `evil-commentary` is by `package.el` through
melpa [melpa](http://melpa.milkbox.net/#/getting-started) then try it
with

```lisp
M-x evil-commentary-mode
```

To enable `evil-commentary` permanently, add

```lisp
(evil-commentary-mode)
```

to your `init.el`.

Or manually clone [evil-commentary] to your `loadpath` and add those
line to `init.el`

```lisp
(add-to-list 'load-path "/path/to/evil-commentary")
(require 'evil-commentary)
(evil-commentary-mode)
```

## Default mappings

The default mappings will enable the `operator` `evil-commentary` to
<kbd>gc</kbd>. That means we will be free to use it with any available
`motions` and `arguments`. <kbd>gcc</kbd> does also work as
expected. Try <kbd>gcap</kbd> to comment out a paragraph or to uncomment
a paragraph that is already commented out.

`:g/TODO/evil-commentary` can be used to toggle comments on all lines
that contain the string "TODO".

I also bind <kbd>super</kbd>+<kbd>/</kbd> as an stand-alone *defacto*
default key binding in most text-editor. It's should work in `emacs` and
`insert` state too. (Evil is however still required.)

## Comment function

By default, `evil-commentary` use `comment-or-uncomment` function. By
specify an alist of modes
`evil-commentary-comment-function-for-mode-alist`, the comment
function provided by major mode will be use instead.

A comment functions has to accept BEG, END as its required parameter.
See
[this commit](https://github.com/linktohack/evil-commentary/commit/9f5bc144c591f0bec7da8dd325fa24235f0412df)
if a customized one is needed.

## Custom mappings

You're free to map `evil-commentary` and `evil-commentary-line` to
anything you want. If you find that <kbd>,cc</kbd> is more
elegant/convenient, consider having a look on [evil-space] to keep
`evil-repeat-find-char` functional...

To customize keys, consider add something like this into `init.el`.

```lisp
(evil-define-key 'normal evil-commentary-mode-map ",c" 'evil-commentary)
(define-key evil-commentary-mode-map (kbd "M-;") 'evil-commentary-line)
```

[evil-commentary]: https://github.com/linktohack/evil-commentary
[evil-mode]: https://gitorious.org/evil/pages/Home
[vim-commentary]: https://github.com/tpope/vim-commentary
[tpope]: https://github.com/tpope
[evil-space]: https://github.com/linktohack/evil-space
