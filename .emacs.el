(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq
 magit-define-global-key-bindings 'recommended
 inhibit-startup-screen t
 frame-resize-pixelwise t
 winner-ring-size 50
 )
(setq-default
 tab-width 4
 indent-tabs-mode nil
 )

(scroll-bar-mode 0)
(column-number-mode 1)
(winner-mode 1)

(defun my/c-mode-common-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t))
(add-hook 'c-mode-common-hook 'my/c-mode-common-hook)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd ";") 'dired-do-async-shell-command))


(defun my/scroll-half-down ()
  (interactive)
  (let ((h (window-total-height)))
    (scroll-down-line (/ h 2))))
(defun my/scroll-half-up ()
  (interactive)
  (let ((h (window-total-height)))
    (scroll-up-line (/ h 2))))
(defun my/scroll-half-down-other-window ()
  (interactive)
  (let ((h (window-total-height (next-window))))
    (scroll-other-window-down (/ h 2))))
(defun my/scroll-half-up-other-window ()
  (interactive)
  (let ((h (window-total-height (next-window))))
    (scroll-other-window (/ h 2))))

(defun my/toggle-line-numbers ()
  (interactive)
  (setq display-line-numbers
        (if (eq nil display-line-numbers) 'relative nil)))

(defun my/change-window-size (func vh size)
  (if (= size 0) (message "Invalid Size: 0")
    (let ((es (if (> size 0) "Enlarge" "Shrink")))
      (message "%s %s by %d" es vh (abs size))
      (funcall func size))))

(defun my/change-window-size-v (size)
  (interactive "NChange window size vertically: ")
  (my/change-window-size 'enlarge-window "vertically" size))

(defun my/change-window-size-h (size)
  (interactive "NChange window size horizontally: ")
  (my/change-window-size 'enlarge-window-horizontally "horizontally" size))

(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

(defun my/char-string (char)
  (cond
   ((eq char 32) "SPACE")
   ((eq char 40) "'('")
   ((eq char 41) "')'")
   (t (string char))))

(defun my/mark-to-char (arg char movement)
  (when (and (> char 31) (< char 127))
    (let ((ma mark-active)
          (cfs case-fold-search))
      (setq case-fold-search nil)
      (unless ma (set-mark-command nil))
      (if (search-forward (char-to-string char) nil t arg)
          (progn
            (message "Marked until %s (%d)" (my/char-string char) char)
            (right-char movement))
        (message "Char %s (%d) not found" (my/char-string char) char)
        (unless ma (deactivate-mark)))
      (setq case-fold-search cfs))))

(defun my/mark-forward-to (arg char)
  (interactive "p\ncMark forward to: ")
  (my/mark-to-char arg char 0))

(defun my/mark-backward-to (arg char)
  (interactive "p\ncMark backward to: ")
  (my/mark-to-char (- arg) char 0))

(defun my/mark-forward-until (arg char)
  (interactive "p\ncMark forward until: ")
  (my/mark-to-char arg char -1))

(defun my/mark-backward-until (arg char)
  (interactive "p\ncMark backward until: ")
  (my/mark-to-char (- arg) char 1))

(defun my/transpose-line-forward (arg)
  (interactive "p")
  (next-line)
  (transpose-lines arg)
  (previous-line))
(defun my/transpose-line-backward (arg)
  (interactive "p")
  (next-line)
  (transpose-lines (- arg))
  (previous-line))

(defun my/duplicate-dwim (arg)
  (interactive "p")
  (duplicate-dwim arg)
  (next-line))
(defun my/duplicate-line (arg)
  (interactive "p")
  (duplicate-line arg)
  (next-line))

(defun my/other-window-1 ()
  (interactive)
  (other-window -1))
(defun my/split-window-below ()
  (interactive)
  (split-window-below)
  (windmove-down))
(defun my/split-window-right ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun my/spawn-st ()
  (interactive)
  (start-process "Terminal" nil "st"))

(keymap-global-unset "C-x C-z")
(keymap-global-unset "M-v")
(keymap-global-unset "C-q")
(keymap-global-unset "M-q")
(keymap-global-unset "C-z")
(keymap-global-unset "C-M-v")
(keymap-global-unset "C-M-S-v")

(keymap-global-unset "C-]")
(keymap-global-unset "C-\\")

(keymap-global-set "<f1>"    'my/spawn-st)
(keymap-global-set "<f2>"    'shell)
(keymap-global-set "<f3>"    'my/change-window-size-v)
(keymap-global-set "<f4>"    'my/change-window-size-h)

(keymap-global-set "M-S"     'save-buffer)
(keymap-global-set "C-v"     'visual-line-mode)

(keymap-global-set "C-^"     'undo)
(keymap-global-set "C-]"     'undo)
(keymap-global-set "C-<tab>" 'other-window)

(keymap-global-set "C-{"     'winner-undo)
(keymap-global-set "C-}"     'winner-redo)

(keymap-global-set "<prior>"   'my/scroll-half-down)
(keymap-global-set "<next>"    'my/scroll-half-up)
(keymap-global-set "C-<prior>" 'scroll-down-command)
(keymap-global-set "C-<next>"  'scroll-up-command)

(keymap-global-set "C-,"   'my/scroll-half-down)
(keymap-global-set "C-."   'my/scroll-half-up)
(keymap-global-set "C-<"   'my/scroll-half-down-other-window)
(keymap-global-set "C->"   'my/scroll-half-up-other-window)
(keymap-global-set "M-,"   'scroll-down-command)
(keymap-global-set "M-."   'scroll-up-command)
(keymap-global-set "M-<"   'scroll-other-window-down)
(keymap-global-set "M->"   'scroll-other-window)
(keymap-global-set "C-M-," 'beginning-of-buffer)
(keymap-global-set "C-M-." 'end-of-buffer)
(keymap-global-set "C-M-<" 'beginning-of-buffer-other-window)
(keymap-global-set "C-M->" 'end-of-buffer-other-window)

(keymap-global-set "M-z" 'backward-delete-char-untabify)
(keymap-global-set "M-Z" 'delete-char)
(keymap-global-set "M-o" 'my/duplicate-dwim)
(keymap-global-set "M-O" 'my/duplicate-line)

(keymap-global-set "M-p" 'backward-paragraph)
(keymap-global-set "M-n" 'forward-paragraph)
(keymap-global-set "M-[" 'my/transpose-line-backward)
(keymap-global-set "M-]" 'my/transpose-line-forward)

(keymap-global-set "C-M-k"   'kill-sexp)
(keymap-global-set "C-M-S-k" 'backward-kill-sexp)

(keymap-global-set "C-z ,"   'rename-buffer)
(keymap-global-set "C-z r"   'revert-buffer)
(keymap-global-set "C-z k"   'kill-current-buffer)

(keymap-global-set "C-z t"   'load-theme)
(keymap-global-set "C-z C-t" 'disable-theme)
(keymap-global-set "C-z >"   'suspend-emacs)

(keymap-global-set "C-q 1"   'delete-other-windows)
(keymap-global-set "C-q C-1" 'delete-other-windows)
(keymap-global-set "C-q 0"   'delete-window)
(keymap-global-set "C-q C-0" 'delete-window)
(keymap-global-set "C-q 2"   'my/change-window-size-v)
(keymap-global-set "C-q 3"   'my/change-window-size-h)

(keymap-global-set "C-q q"   'buffer-menu)
(keymap-global-set "C-q C-q" 'buffer-menu)
(keymap-global-set "C-q TAB" 'switch-to-buffer)

(keymap-global-set "C-q C-w" 'whitespace-mode)
(keymap-global-set "C-q C-e" 'read-only-mode)
(keymap-global-set "C-q C-s" 'string-rectangle)
(keymap-global-set "C-q C-v" 'visual-line-mode)
(keymap-global-set "C-q C-a" 'org-agenda)
(keymap-global-set "C-q C-p" 'org-toggle-inline-images)
(keymap-global-set "C-q C-n" 'my/toggle-line-numbers)

(keymap-global-set "C-q r"   'jump-to-register)
(keymap-global-set "C-q R"   'window-configuration-to-register)
(keymap-global-set "C-q M-r" 'point-to-register)

(keymap-global-set "C-q y"   'winner-undo)
(keymap-global-set "C-q C-y" 'winner-redo)

(keymap-global-set "C-q f"   'my/mark-forward-until)
(keymap-global-set "C-q C-f" 'my/mark-backward-until)
(keymap-global-set "C-q t"   'my/mark-forward-to)
(keymap-global-set "C-q C-t" 'my/mark-backward-to)

(keymap-global-set "C-q C-j" 'bookmark-jump)
(keymap-global-set "C-q C-k" 'bookmark-set)
(keymap-global-set "C-q C-l" 'bookmark-bmenu-list)

(keymap-global-set "C-q h"   'windmove-left)
(keymap-global-set "C-q j"   'windmove-down)
(keymap-global-set "C-q k"   'windmove-up)
(keymap-global-set "C-q l"   'windmove-right)
(keymap-global-set "C-q H"   'split-window-right)
(keymap-global-set "C-q J"   'my/split-window-below)
(keymap-global-set "C-q K"   'split-window-below)
(keymap-global-set "C-q L"   'my/split-window-right)

(keymap-global-set "C-q x"   'my/spawn-st)
(keymap-global-set "C-q X"   'shell)

(keymap-global-set "C-q ["   'shell-command)
(keymap-global-set "C-q ]"   'compile)
(keymap-global-set "C-q C-]" 'recompile)

(keymap-global-set "C-q '"   'quoted-insert)
(keymap-global-set "C-q C-'" 'quoted-insert)

(keymap-global-set "C-q \\"   'toggle-input-method)
(keymap-global-set "C-q C-\\" 'set-input-method)


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


(set-frame-font "monospace 12" nil t)
(set-fontset-font "fontset-default" 'kana "Migu 1M")
(set-fontset-font "fontset-default" 'han "Migu 1M")
(set-fontset-font "fontset-default" 'greek "Noto Sans Mono")


(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


(require 'color)
(let* ((ws-lighten 30)
       (ws-color (color-lighten-name "#880044" ws-lighten)))
  (custom-set-faces
   `(whitespace-newline                ((t (:foreground ,ws-color))))
   `(whitespace-missing-newline-at-eof ((t (:foreground ,ws-color))))
   `(whitespace-space                  ((t (:foreground ,ws-color))))
   `(whitespace-space-after-tab        ((t (:foreground ,ws-color))))
   `(whitespace-space-before-tab       ((t (:foreground ,ws-color))))
   `(whitespace-tab                    ((t (:foreground ,ws-color))))
   `(whitespace-trailing               ((t (:foreground ,ws-color))))))


(setq
 skk-user-directory "~/.emacs.d/ddskk"
 skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO.L"
 )

(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(pyim-default-scheme 'quanpin)
