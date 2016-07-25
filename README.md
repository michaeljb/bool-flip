## Bool-flip

Bool-flip is a simple utility to quickly change the boolean value under the
point. For example, it changes "true" to "false", and vice versa.

## Usage

Add these lines to your `.emacs` file:

```
(require 'bool-flip)
(global-set-key (kbd "C-c b") bool-flip-do-flip)
```

To add your own boolean pairs:

```
(bool-flip-pair "positive" "negative")
```

To add a pair that will be active only for a specific mode:

```
(bool-flip-pair "t" "nil" "emacs-lisp-mode")
```

## Changelog

### 1.0.0
  * Initial release.
  * Basic true/false and yes/no pairs, as well as 1/0.
  * t/nil pair for Emacs Lisp modes.
