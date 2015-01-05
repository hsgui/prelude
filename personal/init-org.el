(require 'prelude-org)

;;set the global key to capture notes, todo, bookmarks and so on
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/work")
(setq org-default-notes-file (concat org-directory "/note.org"))

;; set the SEQ_TODO, the vertical bar separates the TODO keywords (states that need action) from the DONE states (which need no further action)
;; C-c C-t will cycle an entry from TODO to STARTED, then to WAITING, to APPT, finally to DONE, CANCELED, and DEFERED
(setq org-todo-keywords
	  '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "|" "DONE(d)" "CANCELED(c)" "DEFERED(f)")))

;; set the agenda files, if an entry is a directory, all files in that directory that are matched by 'org-agenda-file-regexp' will be part of the agenda file list
(setq org-agenda-files (list "~/work"))

;; set refile targets
;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
			 (org-agenda-files :maxlevel . 9))))

;; Use full outline paths for refile targets
(setq org-refile-use-outline-path t)

;; Org capture settings for capturing tasks, Notes, bookmark.
(setq org-capture-templates
	  '(("w" "work" entry (file+datetree (concat org-directory "/work.org"))
             "* TODO %?%^{Description} %U %^g"
             :empty-lines 1)
            ("l" "Learning" entry (file+headline (concat org-directory "/todo.org") "LearningNote")
             "* TODO %?%^{Description} %U %^g\n")
            ;; (file+headline "path/to/file" "node headline")
            ("b" "Bookmark" entry (file+headline (concat org-directory "/todo.org") "Bookmark")
             ;; %? -- After completing the template, position cursor here.
             ;; %^{prompt} --  prompt the user for a string and replace this sequence with it
             "** %?%^{Description} %^g\n%^{url}\n%U\n")))

;; separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)

