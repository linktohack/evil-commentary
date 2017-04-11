# evil-commentary

[evil-commentary] is an Emacs package for [evil-mode]
that intends to make it easy to comment out (lines of) code:

* <kbd>gcc</kbd> comments out a line (takes a count)
* <kbd>gc</kbd> comments out the target of a motion,
  e.g. <kbd>gcap</kbd> to comment out a paragraph (normal state)
  and <kbd>gc</kbd> to comment out the selection (visual state).

This package is a port of the [vim-commentary] plugin for Vim.
I wrote this because I really admire the work of [tpope],
its author, and wanted to have something really simple
(less than 100 lines) like [vim-commentary].

[evil-commentary] is considered feature complete as of `v2.0.0`,
though additional integrations may be added in the future.


## Installation

The easiest way to install `evil-commentary` is to use `package.el` to
obtain it from [Melpa](https://melpa.org/#/getting-started):


```lisp
M-x package-install RET evil-commentary RET
```

You can now try it with:

```lisp
M-x evil-commentary-mode
```

To enable `evil-commentary` permanently, add

```lisp
(evil-commentary-mode)
```

to your `init.el`.

Alternatively, you can manually clone [evil-commentary]
to your `load-path` using something like this:

```lisp
(add-to-list 'load-path "/path/to/evil-commentary")
(require 'evil-commentary)
(evil-commentary-mode)
```


## Usage

Here is an overview of the provided commands and their default key bindings:

| Map | Command                   |
|-----|---------------------------|
| gc  | evil-commentary           |
| gy  | evil-commentary-yank      |
| s-/ | evil-commentary-line      |
|     | evil-commentary-yank-line |

### Comment and uncomment

The default key bindings use <kbd>gc</kbd>
for the `evil-commentary` operator command.
That means it can be used with all available motions and counts,
just like other operator commands, such as `evil-delete`.
<kbd>gcc</kbd> comments out a line,
and <kbd>3gcc</kbd> comments out three lines.
Try <kbd>gcap</kbd> to comment out a paragraph
or to uncomment a paragraph that is already commented out.

`evil-commentary` can also be used in the `ex` command line,
which is usually brought up by pressing `:`. As an example,

```
:g/TODO/evil-commentary
```

toggles comments on all lines that contain the string "TODO".

The default bindings also bind <kbd>super</kbd>+<kbd>/</kbd>
to `evil-commentary-line`, which comments out a single line,
since that is the *de facto* standard shortcut in many text editors.
It also works in `emacs` and `insert` states.
(Keep in mind that `evil` is still required.)

### Copy and comment

When editing code,
it is common to try different variations of a piece of code,
or to run a program with different settings.
This is where `evil-commentary-yank`
(and `evil-commentary-yank-line`) can be very helpful.
This command does the same as `evil-commentary`,
but also copies the original (uncommented) code
so that it can be easily pasted and modified afterwards.
By default, this functionality is bound to <kbd>gy</kbd>.
As an example, <kbd>gyyp</kbd> comments out a line of code (<kbd>gyy</kbd>)
and puts the original line of code after the current one (<kbd>p</kbd>).


## Customization

### Comment function

By default, `evil-commentary` uses the `comment-or-uncomment` function.
It is possible to specify a different comment function by adding it
`evil-commentary-comment-function-for-mode-alist`, which is an
`alist` that maps a major mode (a symbol) to a comment function
(also a symbol).

A comment function must accept `beg` and `end` (both buffer positions)
as its required parameters. You can use the source code for the bundled
integrations as an example.

### Key bindings

You can bind `evil-commentary` and `evil-commentary-line` to
other keys than the defaults. For example:

```lisp
(define-key evil-motion-state-map "," nil)
(evil-define-key 'normal evil-commentary-mode-map
  ",c" 'evil-commentary)
(define-key evil-commentary-mode-map
  (kbd "M-;") 'evil-commentary-line)
```

If you think that <kbd>,cc</kbd> is more convenient,
have a look at [evil-space] to keep `evil-repeat-find-char` functional.


[evil-commentary]: https://github.com/linktohack/evil-commentary
[evil-mode]: https://bitbucket.org/lyro/evil/wiki/Home
[vim-commentary]: https://github.com/tpope/vim-commentary
[tpope]: https://github.com/tpope
[evil-space]: https://github.com/linktohack/evil-space
