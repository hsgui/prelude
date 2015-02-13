;; this is only available for the initial frame, not all frames (for example C-x 5 f)
;; (set-default-font "Inconsolata 12")
(setq default-frame-alist '((width . 120) (font . "Inconsolata 12")))

;; set italic font for italic face, since Emacs does not set italic
(set-face-attribute 'italic nil
                    :family "Inconsolata-Italic")

;; in the core/prelude-editor.el:
;; (add-hook 'text-mode-hook 'prelude-enable-wihtespace) makes the text mode enable whitespace minor mode
;; and org-mode is derived from text mode, so the line-column is 80
;; but this makes the Org files urgly!
;(setq whitespace-line-column 512) ;; no line length limit
;(setq whitespace-style nil) ;; I don't like the look.

;; prelude-whitespace is defined in prelude-custom.el
(setq prelude-whitespace nil)
;; disable the spell checking on the fly
(setq prelude-flyspell nil)

(prelude-require-package 'nyan-mode)
(case window-system
  ((x w32) (nyan-mode)))

(set-face-attribute 'helm-selection nil :underline t)
