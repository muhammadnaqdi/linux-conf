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

(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)

(put 'dired-find-alternate-file 'disabled nil)
(setq make-backup-files nil)
(global-set-key (kbd "C-z") nil)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; (package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

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
  :hook ((after-init . global-company-mode)))

(use-package flycheck
  :ensure t
  :hook ((after-init . global-flycheck-mode)))

(use-package yasnippet
  :ensure t
  :hook ((after-init . yas-global-mode)))

(use-package yasnippet-snippets
  :after (yasnippet)
  :ensure t
  :config
  (setq yas-snippet-dirs
	(list (concat user-emacs-directory "snippets"))))

(use-package haskell-mode
  :ensure t)

(use-package geiser
  :ensure t
  :config
  (setq geiser-active-implementations '(mit)))

(use-package geiser-mit
  :ensure t
  :config
  (setq geiser-mit-binary "/usr/bin/scheme"))

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode .         enable-paredit-mode)
	 (lisp-mode .               enable-paredit-mode)
	 (scheme-mode .             enable-paredit-mode)))

(use-package rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode .         rainbow-delimiters-mode)
	 (lisp-mode .               rainbow-delimiters-mode)
	 (lisp-interaction-mode .   rainbow-delimiters-mode)
	 (sly-mrepl-mode .          rainbow-delimiters-mode)
	 (scheme-mode .             rainbow-delimiters-mode)
	 (geiser-repl-mode .        rainbow-delimiters-mode)))

(use-package eglot
  :ensure t
  :config 
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  :hook ((c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)))

(use-package erc
  :ensure t
  :hook ((erc-mode      . flyspell-mode)
	 (erc-mode      . (lambda () (display-line-numbers-mode -1)))))

(defun erc-libera ()
  (interactive)
  (erc-tls :server "irc.libera.chat"
           :port 6697
           :nick "<nick>"
           :password "<password>"))

(defun erc-slash ()
  (interactive)
  (erc-tls :server "irc.slashnet.org"
           :port 6697
           :nick "<nick>"
           :password "<password>"))

(use-package emojify
  :ensure t)

(use-package telega
  :ensure t
  :hook
  ((telega-chat-mode . flyspell-mode)
   (telega-chat-mode . telega-auto-download-mode)
   (telega-chat-mode . telega-autoplay-mode)
   (telega-chat-mode . emojify-mode)
   (telega-chat-mode . (lambda () (display-line-numbers-mode -1)))
   (telega-root-mode . emojify-mode)
   (telega-root-mode . (lambda () (display-line-numbers-mode -1)))))

(use-package eww
  :ensure t
  :hook
  ((eww-mode . emojify-mode)
   (eww-mode . (lambda () (display-line-numbers-mode -1)))))

(use-package emms
  :ensure t
  :config
  (emms-all)
  (setq emms-player-list '(emms-player-vlc)
	emms-info-functions '(emms-info-native)))
