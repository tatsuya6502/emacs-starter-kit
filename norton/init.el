;; doc
(add-to-list 'auto-mode-alist '("\\.doc$" . doc-mode))
(autoload 'doc-mode "doc-mode")

;; flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'doc-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'erlang-mode-hook 'flyspell-prog-mode)
(add-hook 'latex-mode-hook 'flyspell-prog-mode)
(add-hook 'perl-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'flyspell-prog-mode)

;; whitespace
(require 'whitespace)
(setq whitespace-space 'underline)
(set-default 'whitespace-auto-cleanup t)
(set-default 'whitespace-check-buffer-leading nil)
(set-default 'whitespace-check-buffer-trailing t)
(set-default 'whitespace-check-buffer-indent nil)
(set-default 'whitespace-check-buffer-spacetab t)
(set-default 'whitespace-check-buffer-ateol t)

(add-hook 'after-change-major-mode-hook 'whitespace-mode)

;; display only tails of lines longer than 80 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 80
      whitespace-style '(tabs trailing lines-tail))
;; face for long lines' tails
(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
;; face for Tabs
(set-face-attribute 'whitespace-tab nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

;; before-save-hook
(defun unix-newline () (set-buffer-file-coding-system 'undecided-unix))
(add-hook 'before-save-hook 'unix-newline)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; indent
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; tramp
(require 'tramp)
(setq tramp-default-method "scp")

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
(set-variable 'confirm-kill-emacs 'yes-or-no-p)

;; printing
(set-variable 'ps-landscape-mode t)
(set-variable 'ps-number-of-columns 2)
(set-variable 'ps-paper-type 'a4)

;; misc
(set-variable 'visible-bell t)
(server-start)
(column-number-mode 1)
