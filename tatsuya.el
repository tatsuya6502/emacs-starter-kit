
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (set-scroll-bar-mode 'right))

;;; M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;;; 選択範囲(リージョン)のハイライト
(transient-mark-mode 1)

;;; 対応する{}をハイライト
(show-paren-mode 1)

;; Clozure CLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "ccl")
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; SLIMEのロード
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))
;; SLIMEからの入力をUTF-8に設定
(setq slime-net-coding-system 'utf-8-unix)

;; Auto Complete Mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; ac-slime
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ac-slime"))
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
