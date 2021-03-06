# Bicep-mode

A major mode for the [Bicep language](https://github.com/Azure/bicep).

I recently started working with Bicep, but found out that there was no package for Emacs. This is my first attempt at writing a package for Emacs, so it can be a bit rough around the edges.

## What works 
- Very basic syntax highlighting
- LSP Intergration (thanks to [damienpontifex](https://github.com/Azure/bicep/issues/1141#issuecomment-749372637))

## Installing the bicep LSP client
to make this work, you need to install the lsp client 

```shell
(cd $(mktemp -d) \
    && curl -fLO https://github.com/Azure/bicep/releases/latest/download/bicep-langserver.zip \
    && sudo rm -rf /usr/local/bin/bicep-langserver \
    && sudo unzip -d /usr/local/bin/bicep-langserver bicep-langserver.zip)
```

I'm working on making this a variable.

## Installing this package

This package is not in melpa yet, here are some options to install it.

### straight

``` emacs-lisp
(bicep-mode :type git :host github :repo "christiaan-janssen/bicep-mode")
```

### Doom Emacs 
With Doom Emacs you can clone the package to a local dir and add this to you `config.el`:

``` emacs-lisp
(use-package! "bicep-mode"
  :load-path "path/to/bicep-mode")
```
