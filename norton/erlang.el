;; This is needed for Erlang mode setup

(defun wild (dir stem)
  "returns the last (alphabetically) filename that matches dir/stem*."
  (car
   (reverse
    (sort
     (let (value)
       (dolist (element (file-name-all-completions stem dir) value)
         (setq value (cons (concat dir element) value)))) 'string-lessp))))

(setq erlang-root-dir "/usr/local/lib/erlang/")
(setq load-path (cons (concat (wild (concat erlang-root-dir "/lib/") "tools-") "emacs") load-path))
(setq exec-path (cons (concat erlang-root-dir "/bin") exec-path))
(require 'erlang-start)
(add-hook 'erlang-mode-hook
	  (lambda ()
	    ;; when starting an Erlang shell in Emacs, the node
	    ;; name by default should be "emacs"
	    (setq inferior-erlang-machine-options '("-sname" "emacs"))
	    ;; add Erlang functions to an imenu menu
	    (imenu-add-to-menubar "imenu")))
