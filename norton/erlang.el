;; This is needed for Erlang mode setup
(defun erlang-setup ()
  (if (file-exists-p (expand-file-name "~/workbrew/lib/erlang"))
      (setq erlang-basefolder (expand-file-name "~/workbrew/lib/erlang"))
    (if (file-exists-p "/usr/local/lib/erlang")
        (setq erlang-basefolder "/usr/local/lib/erlang")))
  (if erlang-basefolder
      (progn
        (let ((lib-folder (concat erlang-basefolder "/lib")))
          (dolist (fldr (directory-files lib-folder))
            (if (and
                 (> (length fldr) 6)
                 (string= (substring fldr 0 6) "tools-"))
                (setq erlang-tools-dir (concat lib-folder (concat "/" fldr)))))
          (setq load-path (cons (concat erlang-tools-dir "/emacs") load-path))
          (setq erlang-root-dir erlang-basefolder)
          (setq exec-path (cons (concat erlang-basefolder "/bin")  exec-path))
          (require 'erlang-start)
          (add-hook 'erlang-mode-hook
                    (lambda ()
                      ;; when starting an Erlang shell in Emacs, the node
                      ;; name by default should be "emacs"
                      (setq inferior-erlang-machine-options '("-sname" "emacs"))
                      ;; add Erlang functions to an imenu menu
                      (imenu-add-to-menubar "imenu")))))))

(erlang-setup)
