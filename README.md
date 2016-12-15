## Bool-flip

Bool-flip is a simple utility to quickly change the boolean value under the
point. For example, it changes "true" to "false", and vice versa.

## Installation

Install via [MELPA](https://melpa.org/).

## Usage

Add these lines to your `.emacs` file:

```
(require 'bool-flip)
(global-set-key (kbd "C-c b") 'bool-flip-do-flip)
```

## Changelog

### 1.0.1

  * Fix yes/no pair (was
    yes/yes). Thanks
    [@nixmaniack](https://github.com/nixmaniack). ([#5](https://github.com/michaeljb/bool-flip/pull/5))
  * Documentation
    fix. Thanks
    [@solkaz](https://github.com/solkaz). ([#4](https://github.com/michaeljb/bool-flip/pull/4))

### 1.0.0
  * Initial release.
  * Basic true/false and yes/no pairs, as well as 1/0.
