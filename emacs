(require 'package)

;; Essential settings.
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(global-visual-line-mode nil)
(setq-default left-fringe-width nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq visible-bell t)

;; Plugins
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.
     Return a list of installed packages or nil for every skipped package."
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'key-chord
                          'ace-jump-mode
                          'evil
                          'evil-matchit
                          'evil-leader
                          'projectile
                          'magit
                          'org
                          'helm
                          'helm-projectile
                          'company)

;; Elm
(ensure-package-installed 's
                          'f
                          'let-alist
                          'elm-mode)

(require 'elm-mode)

;; Rust
(ensure-package-installed 'rust-mode
                          'racer
                          'company-racer)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook (evil-leader/set-key
  "g" 'racer-find-definition))

;; Try stroring the mark before racer-find-definition
(add-hook 'racer-mode-hook (defadvice racer-find-definition (before racer-set-mark activate)
      (push-mark)))

(require 'rust-mode)

;; COMPANY
(add-hook 'after-init-hook 'global-company-mode)

;; EVIL MODE

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'helm-find-files
  "b" 'helm-multi-files
  "k" 'kill-buffer
  "x" 'helm-M-x
  "j" 'evil-ace-jump-word-mode ; ,e for Ace Jump (word)
  "p" 'pop-global-mark)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require 'evil)
(evil-mode t)

(define-key evil-insert-state-map (kbd "C-p") 'company-indent-or-complete-common)

;; HELM CONFIG (stolen from https://github.com/thierryvolpiatto/emacs-tv-config/blob/master/init-helm-thierry.el)
(require 'projectile)
(require 'helm-config)
(require 'helm-projectile)
(helm-mode 1)
(helm-adaptative-mode 1)
(helm-push-mark-mode 1)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

;;(after 'projectile
;;       ('helm-projectile-on))

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;; Helm key map
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;;; Global-map
(global-set-key (kbd "M-x")                          'undefined)
(global-set-key (kbd "M-x")                          'helm-M-x)

;;Exit insert mode by pressing j and then k quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

