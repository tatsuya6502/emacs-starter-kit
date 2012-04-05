

(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
;; (if (fboundp 'scroll-bar-mode) (set-scroll-bar-mode 'right))

;; M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; 選択範囲(リージョン)のハイライト
(transient-mark-mode 1)

;; 対応する{}をハイライト
(show-paren-mode 1)


;; color-theme
(setq load-path (cons "~/.emacs.d/color-theme-6.6.0" load-path))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-tm)))

;; whitespace
(require 'whitespace)
(setq whitespace-space 'underline)
(set-default 'whitespace-auto-cleanup t)
(set-default 'whitespace-check-buffer-leading nil)
(set-default 'whitespace-check-buffer-trailing t)
(set-default 'whitespace-check-buffer-indent nil)
(set-default 'whitespace-check-buffer-spacetab t)
(set-default 'whitespace-check-buffer-ateol t)
(global-whitespace-mode 1)

(add-hook 'after-change-major-mode-hook 'whitespace-mode)

;; display only tails of lines longer than 80 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 80
      whitespace-style '(tabs trailing lines-tail))
;; face for long lines' tails
(set-face-attribute 'whitespace-line nil
                    :background "gray20"
                    :foreground "DarkSlateGray4"
                    ;; :weight 'bold
                    )
;; face for Tabs
(set-face-attribute 'whitespace-tab nil
                    :background "gray20"
                    :foreground "DarkSlateGray4"
                    ;; :weight 'bold
                    )

;; before-save-hook
(defun unix-newline () (set-buffer-file-coding-system 'undecided-unix))
(add-hook 'before-save-hook 'unix-newline)
(add-hook 'before-save-hook 'whitespace-cleanup)


;; indent
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


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

;; Fonts setting
(set-default-font "Inconsolata-10")
(set-face-font 'variable-pitch "Inconsolata-10")
(set-fontset-font (frame-parameter nil 'font)
                   'japanese-jisx0208
                   '("Takaoゴシック" . "unicode-bmp")
                   )

