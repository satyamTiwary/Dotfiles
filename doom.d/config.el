;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Satyam Tiwary"
      user-mail-address "satyam@technoculture.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-tomorrow-night)
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Notes/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Update copyright notice at save
(add-hook 'before-save-hook 'copyright-update)

;; set minor mode to irony-mode for c++ and c
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)

;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Custom settings
(setq ;; Setup documents folder as the base directory conatining all the projects
 projectile-project-search-path `("~/Documents/"))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :config (treemacs-set-scope-type 'Perspectives))


;; ;;
;; ;; https://emacs.zdx.cat/#org401b899
;; ;;

;; ;;(autoload 'flycheck-inline-mode "~/.emacs.d/flycheck-inline/flycheck-inline.el")

;; == Move windows ==
;; move around in split windows using cmd+arrow keys
(global-set-key [s-left] 'windmove-left)
(global-set-key [s-right] 'windmove-right)
(global-set-key [s-up] 'windmove-up)
(global-set-key [s-down] 'windmove-down)

;; move line up and down
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; works for commenting region as well
(global-set-key (kbd "C-;") 'comment-line)

(display-battery-mode 1)

(global-hl-line-mode 1)

(winner-mode 1)

;;(setq golden-ratio-adjust-factor 1.04)
;;(golden-ratio-mode 1)

(global-prettify-symbols-mode 1)


(setq cmake-ide-flags-c "-I/usr/local/include -I/usr/include -I/Users/satyam/zephyrproject")
(require 'rtags) ;; optional, must have rtags installed
;;(cmake-ide-setup)


;;
;; https://github.com/haditim/.doom.d/blob/master/config.el
;;

;; Look and feel

;; ** Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; ** Don't ask to quit
(setq confirm-kill-emacs nil)

;; ** Modeline adjustments
(setq doom-modeline-major-mode-icon t)

;; ** lsp always show breadcrumb
(setq lsp-headerline-breadcrumb-enable t)

;; ** doom-gruvbox for the theme
;;(setq
 ;;doom-theme 'doom-gruvbox)

;; ** error in treemacs icons
;;(doom-themes-treemacs-config)
;;(after! treemacs
  ;;(treemacs-load-theme "doom-colors"))

;; ** Outshine mini mode for all major modes
;;(add-hook 'prog-mode-hook 'outshine-mode)

;; ** Font
;; (setq doom-font (font-spec :family "Dejavu Sans Mono" :size 15))
(setq doom-font (font-spec :family "SF Mono Regular" :size 15))

;; * Keybinds
;; ;; ** Docker-compose
;; (map! :leader
;;       (:desc "Docker"  "d" #'docker)
;;       )

;; ** rgrep in project
(map! :leader
      (:prefix-map ("s" . "search")
       :desc "rgrep in project" "r" #'rgrep))

;; ** Ctrl+vim navigation keys in the evil edit mode
(map! :i "C-l" #'forward-char
      :i "C-h" #'backward-char
      :i "C-k" #'previous-line
      :i "C-j" #'next-line
      :i "C-p" #'previous-line
      :i "C-n" #'next-line)

;; ** jump to paranthesis with tab
(map! :n [tab] 'evil-jump-item)

;; ** expand region
(map! :leader
      (:desc "Expand region"  "v" #'er/expand-region))


;; * Misc
;; ** rgrep ignore some folders
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "auto")
     (add-to-list 'grep-find-ignored-directories "env")
     (add-to-list 'grep-find-ignored-directories "venv")
     (add-to-list 'grep-find-ignored-directories ".pytest_cache")
     (add-to-list 'grep-find-ignored-directories "elpa")))
(setq wgrep-enable-key (kbd "C-c C-c"))
(add-hook 'grep-mode-hook (lambda () (toggle-truncate-lines 1)))

;; ** dired hide files toggle on M-h
(setq my-dired-ls-switches "-alh --ignore=.* --ignore=\\#* --ignore=*~")

(setq my-dired-switch 1)

;; (add-hook 'dired-mode-hook
;;         (lambda ()
;;         "Set the right mode for new dired buffers."
;;         (when (= my-dired-switch 1)
;;         (dired-sort-other my-dired-ls-switches))))

;; (add-hook 'dired-mode-hook
;;         (lambda ()
;;         (define-key dired-mode-map (kbd "M-h")
;;         (lambda ()
;;                 "Toggle between hide and show."
;;                 (interactive)
;;                 (setq my-dired-switch (- my-dired-switch))
;;                 (if (= my-dired-switch 1)
;;                 (dired-sort-other my-dired-ls-switches)
;;                 (dired-sort-other "-alh"))))))
