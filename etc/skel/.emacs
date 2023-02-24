;;; .emacs --- Simple configuration to run Magit

(menu-bar-mode -1)

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)

(setq auto-revert-interval 3)
(setq auto-revert-check-vc-info t)
(global-auto-revert-mode)

(setq make-backup-files nil)
(setq create-lockfiles nil)

(setq enable-recursive-minibuffers t)
(setq tab-always-indent 'complete)
(setq completion-cycle-threshold 1)
(setq completions-detailed t)
(setq completion-styles '(basic initials substring))
(setq completion-auto-help 'always)
(setq completion-auto-select 'second-tab)
(setq completions-max-height 10)

(setq-default mode-line-format nil)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(add-hook 'comint-exec-hook
          (lambda ()
            (let ((process (get-buffer-process (current-buffer))))
              (set-process-query-on-exit-flag process nil))))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(fido-vertical-mode t)

(setq icomplete-delay-completions-threshold 4000)

(define-key minibuffer-mode-map (kbd "TAB") 'minibuffer-complete)

(when (functionp 'repeat-mode)
  (repeat-mode t))

(add-hook 'text-mode-hook
          (lambda ()
            (visual-line-mode t)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default require-final-newline t)

(add-hook 'sgml-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-basic-offset) 1)
            (sgml-guess-indent)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-auto-state t)
            (c-toggle-hungry-state t)))

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (show-paren-local-mode t)))

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (file-directory-p (expand-file-name "elpa" user-emacs-directory))
  (package-refresh-contents))

(require 'use-package nil 'noerror)

(unless (featurep 'use-package)
  (package-install 'use-package))

(use-package magit
  :ensure t
  :bind ("C-c C-s" . magit-status)
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package magit-delta
  :ensure t
  :hook (magit-mode . magit-delta-mode))

(magit-status
 (unless (file-directory-p
          (expand-file-name ".git"))
   (read-directory-name "Git repository: ")))
