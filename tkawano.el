
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (set-scroll-bar-mode 'right))

;; M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; 選択範囲(リージョン)のハイライト
(transient-mark-mode 1)

;; 対応する{}をハイライト
(show-paren-mode 1)


;; Fonts setting
(set-default-font "Inconsolata-10")
(set-face-font 'variable-pitch "Inconsolata-10")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("Takaoゴシック" . "unicode-bmp")
)


;; Start server for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))


;; Erlang Mode
(setq load-path (cons  "/home/tkawano/workbrew/Cellar/erlang-r14-b04/04/lib/erlang/lib/tools-2.6.6.5/emacs/"
                       load-path))

(setq erlang-root-dir  "/home/tkawano/workbrew/Cellar/erlang-r14-b04/04/lib/erlang")
(setq exec-path (cons "/home/tkawano/workbrew/Cellar/erlang-r14-b04/04/lib/erlang/bin" exec-path))
(require 'erlang-start)


;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path "/home/tkawano/.erlang_modules/quviq/eqc-1.24.2/QuickCheck/eqc-1.24.2/emacs/")
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/home/tkawano/.erlang_modules/quviq/eqc-1.24.2/QuickCheck/eqc-1.24.2")
;; EQC Emacs Mode -- Configuration End


;; Haskell Mode
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
   (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
   ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
   ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


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
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; append elrang-mode
(setq ac-modes (append ac-modes (list 'erlang-mode)))

;; ac-slime
(add-to-list 'load-path "~/.emacs.d/ac-slime")
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

