
(push "/usr/local/bin" exec-path)


;; bind M-x rgrep to C-x r
(global-set-key (kbd "C-x r") 'rgrep)
;; bind M-p to Goto line
(global-set-key (kbd "M-p") 'goto-line)



;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
;; enables textmate command + t type file opening (thank god)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(ido-mode 1)

(setq debug-on-error t)

;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil)
(setq auto-save-default nil)

; doing nothing that i can tell
(require 'ansi-color)

(setq inhibit-splash-screen t);; Remove splash screen
(setq-default indent-tabs-mode nil);; always replace tabs with spaces ; tabs are devil characters
(setq-default tab-width 2);; set tab width to 2 for all buffers ; 2 for ruby, probly 4 for everywhere else.
(show-paren-mode 1) ; highlight matching parens
(display-time) ; time
(setq column-number-mode t) ;  column
(setq line-number-mode t) ;line
(add-hook 'before-save-hook 'delete-trailing-whitespace); hopefully this deletes all trailing whitespace on file save
(setq transient-mark-mode t); highlight selection
(defconst search-highlight t); think this highlights search terms...
(fset 'yes-or-no-p 'y-or-n-p);;no more yes-or-no questions please...
(delete-selection-mode t); everybody else is doing it



;; (scroll-bar-mode -1)
;; (tool-bar-mode -1)
;; (blink-cursor-mode t)
;; (show-paren-mode t)
;; (set-fringe-style -1)
;; (tooltip-mode -1)
;; (set-frame-font "Menlo-16")
;; (load-theme 'tango)



;(setq mac-option-modifier 'meta) ; option is alt, can be set in terminal preferences in os x
; this bit it copied from somewhere else, wtf does it do?
;;syntax hilighting is teh roxors
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))




(server-start)
