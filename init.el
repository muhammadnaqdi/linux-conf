(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Berkeley Mono" :foundry "UKWN" :slant normal :weight normal :height 120 :width normal)))))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq make-backup-files nil)
(global-set-key (kbd "C-z") nil)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(use-package org
  :ensure nil
  :config
  (org-element-cache-reset 'all)
  (setq org-clock-sound "~/.alerts/click.wav"
	org-export-with-broken-links t))

  (use-package dired
    :ensure nil
    :config (put 'dired-find-alternate-file 'disabled nil))

(use-package display-line-numbers
  :ensure nil
  :hook (emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode c-mode c++-mode haskell-mode))

(use-package prettify-symbols
  :ensure nil
  :hook
  (emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode eshell-mode sly-mrepl-mode geiser-repl-mode))

(use-package flyspell
  :ensure nil
  :hook (erc-mode telega-chat-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode eshell-mode sly-mrepl-mode geiser-repl-mode))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode scheme-mode) . enable-paredit-mode))

(use-package emojify
  :ensure t
  :hook (eww telega-root-mode telega-chat-mode))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets
  :after (yasnippet)
  :ensure t
  :config (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets"))))

(use-package haskell-mode
  :ensure t)

(use-package geiser
  :ensure t
  :config (setq geiser-active-implementations '(mit)))

(use-package geiser-mit
  :ensure t
  :config (setq geiser-mit-binary "/usr/bin/scheme"))

(use-package sly
  :ensure t
  :config (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package eglot
  :ensure t
  :config 
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  :hook ((c-mode c++-mode) . eglot-ensure))

(defun erc-libera ()
  (interactive)
  (erc-tls :server "irc.libera.chat"
           :port 6697
           :nick "<nickname>"
           :password "<password>"))

(defun erc-slash ()
  (interactive)
  (erc-tls :server "irc.slashnet.org"
           :port 6697
           :nick "<nickname>"
           :password "<password>"))


(use-package telega
  :ensure t
  :config
  (setq telega-chat-bidi-display-reordering t
	telega-emoji-large-height nil
	telega-chat-show-avatars nil
	telega-chat-input-markups (list nil "markdown1" "markdown2" "org"))
  (mapc (lambda (char)
          (set-fontset-font "fontset-default" char "Vazirmatn"))
        (list (cons (decode-char 'ucs #x0609) (decode-char 'ucs #x06F9))
              (decode-char 'ucs #x00AB)
              (decode-char 'ucs #x00BB)))
  :hook
  ((telega-load . telega-auto-download-mode)
   (telega-load . telega-autoplay-mode)
   (telega-load . telega-notifications-mode)))

(use-package emms
  :ensure t
  :config
  (emms-all)
  (setq emms-player-list '(emms-player-vlc)
	emms-info-functions '(emms-info-native)))

(use-package eat
  :ensure t
  :hook (eshell-load . eat-eshell-mode))

(use-package sml-mode
  :ensure t)

(defalias 'soxan-clear-news
   (kmacro "M-< C-s i n d e x . h t m l <return> <return> C-s ت ا ز ه ‌ ه ا <return> C-s < u l <return> C-n C-a C-SPC C-s < / u l C-a <backspace> C-x C-s C-x k <return>"))

(defalias 'soxan-add-to-news
   (kmacro "C-e C-x C-f M-<backspace> i n d e x . h t m l <return> M-< C-s < h 2 C-s <return> C-s < u l > <return> <return> < l i > < a SPC h r e f = \" / C-y C-x b <return> M-x d i r e d - c o p y - f i l e n a m e - a s - k i l l <return> C-x b <return> C-y \" > C-x b <return> <return> M-< C-s < h 2 C-s C-s > <return> C-SPC C-s < / h 2 M-b C-b C-b M-w C-x k <return> C-x b <return> C-y < / a > < / l i > C-x C-s C-x k <return>"))

(defalias 'soxan-update-news-articles
  (kmacro "C-x C-f M-<backspace> i n d e x . h t m l <return> C-s ت ا ز ه ‌ ه ا <return> C-s < l i <return> M-b C-b C-SPC C-s < / u l C-a M-w C-x k <return> M-< C-s ت ا ز ه ‌ ه ا <return> C-s < l i <return> M-b C-b C-SPC C-s < / u l C-a <backspace> C-y"))

(defalias 'soxan-update-news-root
   (kmacro "C-x C-f i n d e x . h t m l <return> C-s ت ا ز ه ‌ ه ا <return> C-s < l i <return> M-b C-b C-SPC C-s < / u l C-a M-w C-x k <return> M-< C-s ت ا ز ه ‌ ه ا <return> C-s < l i <return> M-b C-b C-SPC C-s < / u l C-a <backspace> C-y"))

(defalias 'soxan-add-to-contents
   (kmacro "C-e C-x C-f M-<backspace> c o n t e n t s . h t m l <return> M-< C-s < h 2 C-s C-s <return> C-s < u l <return> C-e <return> < l i > < a SPC h r e f = \" / C-y C-x b <return> M-x d i r e d - c o p y - f i l e n a m e - a s - k i l l <return> C-x b <return> C-y \" > C-x b <return> <return> M-< C-s < h 2 C-s C-s <return> C-f C-SPC C-s < / h 2 <return> M-b C-b C-b M-w C-x k <return> C-x b <return> C-y < / a > < / l i > C-x C-s C-x k <return>"))

(defun soxan-update-news ()
  (interactive)
  (let ((root-dir default-directory)
        (articles-dir (expand-file-name "articles" default-directory)))
    
    (unless (file-directory-p articles-dir)
      (error "No articles directory found in the current working directory"))

    (dolist (file (directory-files root-dir t "^[^.]"))
      (when (and (file-regular-p file)
                 (string-match-p "\\.html$" file)
                 (not (string= (file-name-nondirectory file) "index.html")))
        (find-file file)
        (soxan-update-news-root)
        (save-buffer)
        (kill-buffer)))

    (dolist (file (directory-files articles-dir t "^[^.]"))
      (when (and (file-regular-p file) (string-match-p "\\.html$" file))
        (find-file file)
        (soxan-update-news-articles)
        (save-buffer)
        (kill-buffer)))))
