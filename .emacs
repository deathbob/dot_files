;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
; enables textmate command + t type file opening (thank god)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;(setq ido-use-filename-at-point 'guess)
(ido-mode 1)


(setq debug-on-error t)

;(add-to-list 'load-path "~/elisp/rinari")
(add-to-list 'load-path "~/elisp")
(require 'find-file-in-project)


;; Rinari
; ruby emacs stuff?  maybe only rails
;(require 'rinari)

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




; sets the root directory to run find-file-in-project against to the directory emacs was started in
;(setq ffip-project-root command-line-default-directory)

;(defun my-ido-project-files ()
;  "Use ido to select a file from the project."
;  (interactive)
;  (let (my-project-root project-files tbl)
;    ;;(setq my-project-root "/Users/bob/src/charles_luck/")

;    ;; get project files
;    (setq project-files
;          (split-string
;           (shell-command-to-string
;            (concat "find "
;                    my-project-root
;                    " \\( -name \"*.svn\" -o -name \"*.git\" \\) -prune -o -type f -print | grep -E -v \"\.(pyc)$\""
;                    )) "\n"))
;    ;; populate hash table (display repr => path)
;    (setq tbl (make-hash-table :test 'equal))
;    (let (ido-list)
;      (mapc (lambda (path)
;              ;; format path for display in ido list
;              (setq key (replace-regexp-in-string "\\(.*?\\)\\([^/]+?\\)$" "\\2|\\1" path))
;              ;; strip project root
;              (setq key (replace-regexp-in-string my-project-root "" key))
;              ;; remove trailing | or /
;              (setq key (replace-regexp-in-string "\\(|\\|/\\)$" "" key))
;              (puthash key path tbl)
;              (push key ido-list)
;              )
;            project-files
;            )
;      (find-file (gethash (ido-completing-read "project-files: " ido-list) tbl)))))



;; bind to a key for quick access
;(define-key global-map [f6] 'my-ido-project-files)
;;(define-key global-map [f6] 'my-ido-project-files)

(server-start)
