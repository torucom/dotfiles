;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ==============================
;; UI の設定
;; ==============================

(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type t)

(use-package! which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package! nyan-mode
  :config
  (nyan-mode 1))

;; ==============================
;; 基本設定（Emacs の動作）
;; ==============================

(setq evil-default-state 'emacs)
(setq use-short-answers t)
(setq confirm-kill-emacs nil)

(after! recentf
  (add-to-list 'recentf-exclude
               (lambda (file)
                 (string-match-p (expand-file-name "~/.emacs.d/.local/etc/workspaces/autosave") file))))

;; ==============================
;; キーバインド設定（ナビゲーション）
;; ==============================

(map! "C-s" #'consult-line)
(map! :leader :desc "Toggle Treemacs" "t t" #'treemacs)
(global-set-key (kbd "<f8>") #'treemacs)

(use-package! ace-window
  :config
  (map! "C-x o" #'ace-window))

(use-package! windmove
  :config
  (windmove-default-keybindings))

(after! treemacs
  (treemacs-follow-mode 1)
  (treemacs-project-follow-mode 1))

;; ==============================
;; Undo/Redo の設定
;; ==============================

(use-package! undo-fu
  :config
  (map! "C-/" #'undo-fu-only-undo
        "C-M-/" #'undo-fu-only-redo))

;; ==============================
;; Web 開発環境の設定
;; ==============================

(defun run-vite ()
  "Vite の開発サーバーを Emacs 内で実行"
  (interactive)
  (compile "npm run dev" t))

(use-package! emmet-mode
  :hook ((html-mode css-mode sgml-mode) . emmet-mode)
  :config
  (define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line))

(use-package! nodejs-repl)
;;(use-package! php-mode)

;; ==============================
;; フォーマットツール（手動実行）
;; ==============================

(use-package! prettier-js
  :commands prettier-js)

(use-package! format-all
  :commands format-all-buffer)

;; ==============================
;; カスタム関数
;; ==============================

(defun toggle-font-lock-mode ()
  "シンタックスカラーのオン・オフを切り替える"
  (interactive)
  (if font-lock-mode
      (progn
        (font-lock-mode -1)
        (message "Font Lock Mode OFF"))
    (font-lock-mode 1)
    (message "Font Lock Mode ON")))

(global-set-key (kbd "<f7>") 'toggle-font-lock-mode)

(defun toggle-line-numbers ()
  "行番号の表示/非表示をトグル"
  (interactive)
  (if display-line-numbers-mode
      (progn
        (display-line-numbers-mode -1)
        (message "行番号 OFF"))
    (progn
      (display-line-numbers-mode 1)
      (message "行番号 ON"))))

(global-set-key (kbd "<f9>") #'toggle-line-numbers)

(provide 'config)

;;; config.el ends here;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ==============================
;; UI の設定
;; ==============================

(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type t)

(use-package! which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package! nyan-mode
  :config
  (nyan-mode 1))

;; ==============================
;; 基本設定（Emacs の動作）
;; ==============================

(setq evil-default-state 'emacs)
(setq use-short-answers t)
(setq confirm-kill-emacs nil)

(after! recentf
  (add-to-list 'recentf-exclude
               (lambda (file)
                 (string-match-p (expand-file-name "~/.emacs.d/.local/etc/workspaces/autosave") file))))

;; ==============================
;; キーバインド設定（ナビゲーション）
;; ==============================

(map! "C-s" #'consult-line)
(map! :leader :desc "Toggle Treemacs" "t t" #'treemacs)
(global-set-key (kbd "<f8>") #'treemacs)

(use-package! ace-window
  :config
  (map! "C-x o" #'ace-window))

(use-package! windmove
  :config
  (windmove-default-keybindings))

(after! treemacs
  (treemacs-follow-mode 1)
  (treemacs-project-follow-mode 1))

;; ==============================
;; Undo/Redo の設定
;; ==============================

(use-package! undo-fu
  :config
  (map! "C-/" #'undo-fu-only-undo
        "C-M-/" #'undo-fu-only-redo))

;; ==============================
;; Web 開発環境の設定
;; ==============================

(defun run-vite ()
  "Vite の開発サーバーを Emacs 内で実行"
  (interactive)
  (compile "npm run dev" t))

(use-package! emmet-mode
  :hook ((html-mode css-mode sgml-mode) . emmet-mode)
  :config
  (define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line))

(use-package! nodejs-repl)
;;(use-package! php-mode)

;; ==============================
;; フォーマットツール（手動実行）
;; ==============================

(use-package! prettier-js
  :commands prettier-js)

(use-package! format-all
  :commands format-all-buffer)

;; ==============================
;; カスタム関数
;; ==============================

(defun toggle-font-lock-mode ()
  "シンタックスカラーのオン・オフを切り替える"
  (interactive)
  (if font-lock-mode
      (progn
        (font-lock-mode -1)
        (message "Font Lock Mode OFF"))
    (font-lock-mode 1)
    (message "Font Lock Mode ON")))

(global-set-key (kbd "<f7>") 'toggle-font-lock-mode)

(defun toggle-line-numbers ()
  "行番号の表示/非表示をトグル"
  (interactive)
  (if display-line-numbers-mode
      (progn
        (display-line-numbers-mode -1)
        (message "行番号 OFF")))
    (progn
      (display-line-numbers-mode 1)
      (message "行番号 ON")))

(global-set-key (kbd "<f9>") #'toggle-line-numbers)

(provide 'config)

;;; config.el ends here