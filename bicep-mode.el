;;; bicep-mode.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022  Christiaan Janssen

;; Author: Christiaan Janssen christiaan@drunkturtle.com
;; Keywords: lisp
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides a major mode for the Bicep language
;; Please note that you need to install the bicep language server first!

;;; Code:

(defvar bicep-mode-hook nil)

;; Maybe use make-sparese-keymap
(defvar bicep-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for Bicep major mode")

(add-to-list 'auto-mode-alist '("\\.bicep\\'" . bicep-mode))

(defconst bicep-font-lock-keywords-1
  (list
   '("\\<\\(var\\|resource\\|param\\|params\\|target\\)\\>" . 'font-lock-function-name-face)
   '("\\<\\(module\\|targetScope\\|output\\|existing\\|true\\|false\\|for\\|in\\)\\>" . 'font-lock-builtin-face)
   '("\\<\\w+:\\|parameters:\\>" . 'font-lock-keyword-face)
   '("" . 'font-lock-variable-name-face)))

(define-derived-mode bicep-mode prog-mode "bicep mode"
  "Major mode for editing Bicep Language"
  (setq font-lock-defaults '((bicep-font-lock-keywords-1))))


(with-eval-after-load 'lsp-mode
 (add-to-list 'lsp-language-id-configuration '(bicep-mode . "bicep"))
 (lsp-register-client
  (make-lsp-client :new-connection(lsp-stdio-connection '("dotnet" "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"))
                   :activation-fn (lsp-activate-on "bicep")
                   :server-id 'bicep)))


(provide 'bicep-mode)
