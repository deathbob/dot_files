;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
; enables textmate command + t type file opening (thank god)
(setq ido-enable-flex-matching t)

;; Rinari
; ruby emacs stuff?  maybe only rails
;(add-to-list 'load-path "~/.emacs.d/rinari")
;(require 'rinari)

; doing nothing that i can tell
(require 'ansi-color)

(setq inhibit-splash-screen t);; Remove splash screen
(setq-default indent-tabs-mode nil);; always replace tabs with spaces ; tabs are devil characters
(setq-default tab-width 2);; set tab width to 2 for all buffers ; 2 for ruby, probly 4 for everywhere else.  3 just to fuck with people
(show-paren-mode 1) ; highlight matching parens
(display-time) ; time
(setq column-number-mode t) ;  column
(setq line-number-mode t) ;line
(add-hook 'before-save-hook 'delete-trailing-whitespace); hopefully this deletes all trailing whitespace on file save
(setq transient-mark-mode t); highlight selection
(defconst search-highlight t); think this highlights search terms...
(fset 'yes-or-no-p 'y-or-n-p);;no more yes-or-no questions please...
(delete-selection-mode t); everybody else is doing it


;(setq mac-option-modifier 'meta) ; option is alt, can be set in terminal preferences in os x
; this bit it copied from somewhere else, wtf does it do?
;;syntax hilighting is teh roxors
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))



;(setq backup-inhibited t) ; no backup
; Big fancy thing stolen from elsewhere to hopefully not
; drop stupid backup files all over the damn place

; Smart backup/autosave into secure directory in /tmp (instead of littering)
(defvar user-temporary-file-directory
  (concat temporary-file-directory "emacs-" user-login-name "/"))
(make-directory user-temporary-file-directory t)
(set-file-modes user-temporary-file-directory #o700)

(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq backup-enable-predicate '(lambda (name)
  (and (normal-backup-enable-predicate name)
       (eq (nth 2 (file-attributes name)) (user-uid)))))

(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory "auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
;;


(server-start)
