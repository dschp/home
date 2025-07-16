(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq magit-define-global-key-bindings 'recommended)

(setq inhibit-startup-screen t)

(setq frame-resize-pixelwise t)
(scroll-bar-mode 0)
(column-number-mode 1)


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

(keymap-global-set "<f1>" 'my/spawn-st)
(keymap-global-set "<f2>" 'shell)

(keymap-global-set "M-S"  'save-buffer)
(keymap-global-set "C-v"  'visual-line-mode)

(keymap-global-set "C-]"  'other-window)
(keymap-global-set "C-\\" 'buffer-menu)
(keymap-global-set "C-x C-\\" 'buffer-menu)
(keymap-global-set "C-`"  'switch-to-buffer)
(keymap-global-set "C-;"  'previous-buffer)
(keymap-global-set "C-'"  'next-buffer)

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

(keymap-global-set "C-z s"   'my/mark-forward-until)
(keymap-global-set "C-z r"   'my/mark-backward-until)
(keymap-global-set "C-z C-s" 'my/mark-forward-to)
(keymap-global-set "C-z C-r" 'my/mark-backward-to)

(keymap-global-set "C-z 2"   'my/change-window-size-v)
(keymap-global-set "C-z 3"   'my/change-window-size-h)

(keymap-global-set "C-z c"   'compile)
(keymap-global-set "C-z C-c" 'recompile)
(keymap-global-set "C-z ,"   'rename-buffer)
(keymap-global-set "C-z k"   'kill-current-buffer)
(keymap-global-set "C-z v"   'visual-line-mode)

(keymap-global-set "C-q 1"   'delete-other-windows)
(keymap-global-set "C-q C-1" 'delete-other-windows)
(keymap-global-set "C-q 2"   'split-window-below)
(keymap-global-set "C-q C-2" 'split-window-below)
(keymap-global-set "C-q 3"   'split-window-right)
(keymap-global-set "C-q C-3" 'split-window-right)
(keymap-global-set "C-q 0"   'delete-window)
(keymap-global-set "C-q C-0" 'delete-window)
(keymap-global-set "C-q `"   'delete-window)
(keymap-global-set "C-q C-`" 'delete-window)

(keymap-global-set "C-q C-q" 'quoted-insert)
(keymap-global-set "C-q C-w" 'whitespace-mode)
(keymap-global-set "C-q C-e" 'read-only-mode)
(keymap-global-set "C-q C-r" 'revert-buffer)
(keymap-global-set "C-q C-k" 'kill-current-buffer)

(keymap-global-set "C-q a"   'org-agenda)
(keymap-global-set "C-q C-p" 'org-toggle-inline-images)
(keymap-global-set "C-q n"   'my/toggle-line-numbers)


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


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

(setq-default tab-width 4)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd ";") 'dired-do-async-shell-command))


(setq skk-user-directory "~/.emacs.d/ddskk")
(setq skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO.L")

(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(pyim-default-scheme 'quanpin)

(global-set-key (kbd "s-\\") 'toggle-input-method)
(global-set-key (kbd "s-\=") 'set-input-method)


(require 'exwm)

(setq exwm-workspace-number 4)

(define-key exwm-mode-map (kbd "C-c") nil)
(setq exwm-input-prefix-keys
      '(?\M-x
        ?\M-`
        ?\M-&
        ?\M-:))

(add-hook 'exwm-update-class-hook
  (lambda () (exwm-workspace-rename-buffer exwm-class-name)))

(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset)
        ([?\s-w] . exwm-workspace-switch)
        ([?\s-f] . exwm-floating-toggle-floating)
        ([?\s-z] . exwm-layout-toggle-fullscreen)
        ([?\s-c] . exwm-floating-hide)
        ([?\s-m] . exwm-layout-toggle-mode-line)
        ([?\s-.] . exwm-workspace-move-window)

        ([?\s-e] . switch-to-buffer)
        ([?\s-q] . buffer-menu)
        ([?\s-n] . next-buffer)
        ([?\s-p] . previous-buffer)
        ([?\s-,] . rename-buffer)

        ([?\s-a] . delete-other-windows)
        ([?\s-s] . split-window-below)
        ([?\s-d] . split-window-right)
        ([?\s-x] . delete-window)

        ([?\s-h] . windmove-left)
        ([?\s-j] . windmove-down)
        ([?\s-k] . windmove-up)
        ([?\s-l] . windmove-right)
        ([?\s-\[] . my/other-window-1)
        ([?\s-\]] . other-window)

        ([?\s-t] . my/spawn-st)
        ([?\s-\;] . shell-command)
        ([s-return] . (lambda (cmd)
                        (interactive (list (read-shell-command "$ ")))
                        (start-process-shell-command cmd nil cmd)))
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))
(exwm-wm-mode)
