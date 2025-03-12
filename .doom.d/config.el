;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
                                ;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;MySetting
;; -----------------------------------------------
;; 📝 最近使ったファイルリストに autosave を含めない
;; -----------------------------------------------
(after! recentf
  (add-to-list 'recentf-exclude
               (lambda (file)
                 (string-match-p (expand-file-name "~/.emacs.d/.local/etc/workspaces/autosave") file))))

;; -----------------------------------------------
;; 🖥 Emacs をデフォルトのモードに設定
;; -----------------------------------------------
(setq evil-default-state 'emacs)

;; -----------------------------------------------
;; 🔍 検索とナビゲーションの改善
;; -----------------------------------------------
(map! "C-s" #'consult-line)  ;; `C-s` を `consult-line` に変更

(use-package! ace-window
  :config
  (map! "C-x o" #'ace-window))  ;; `C-x o` でウィンドウ切り替え

(use-package! windmove
  :config
  (windmove-default-keybindings))  ;; Shift + カーソルキーでウィンドウ移動

;; -----------------------------------------------
;; 🔄 Undo/Redo の設定
;; -----------------------------------------------
(use-package! undo-fu
  :config
  (map! "C-/" #'undo-fu-only-undo
        "C-M-/" #'undo-fu-only-redo))

;; -----------------------------------------------
;; 📏 行番号の表示をトグルする関数を定義
;; -----------------------------------------------
(defun toggle-line-numbers ()
  "トグルで行番号の表示/非表示を切り替える"
  (interactive)
  (if display-line-numbers-mode
      (progn
        (display-line-numbers-mode -1)
        (message "行番号 OFF"))
    (progn
      (display-line-numbers-mode 1)
      (message "行番号 ON"))))

;; `F9` で行番号の表示/非表示を切り替え
(global-set-key (kbd "<f9>") #'toggle-line-numbers)

;; -----------------------------------------------
;; ✅ yes/no を y/n に変更
;; -----------------------------------------------
(setq use-short-answers t)

;; -----------------------------------------------
;; 🌐 Web 開発環境の設定
;; -----------------------------------------------
;; 🖌️ シンタックスハイライトの強化
(setq font-lock-maximum-decoration
      '((html-mode . 2)
        (css-mode . 2)
        (scss-mode . 2)
        (sass-mode . 2)
        (js-mode . 2)
        (typescript-mode . 2)
        (json-mode . 2)
;;        (php-mode . 2)
        (prog-mode . 2)  ;; プログラム系のすべてのモード
        (t . 2)))        ;; その他のモードも2に

(global-font-lock-mode t)  ;; グローバルでカラーリングを有効化

;; グローバルでカラーリングが効かない時用 F7でトグル
(defun toggle-font-lock-mode ()
  "Toggle font-lock-mode on and off."
  (interactive)
  (if font-lock-mode
      (progn
        (font-lock-mode -1)
        (message "Font Lock Mode OFF"))
    (font-lock-mode 1)
    (message "Font Lock Mode ON")))

(global-set-key (kbd "<f7>") 'toggle-font-lock-mode) ;; F7キーでトグル

;; 🖍️ フォントロック (カラーリング) を確実に適用
(dolist (hook '(html-mode-hook
                css-mode-hook
                scss-mode-hook
                sass-mode-hook
                js-mode-hook
                typescript-mode-hook
                json-mode-hook
;;                php-mode-hook
                prog-mode-hook))  ;; すべてのプログラム系モードで適用
  (add-hook hook (lambda ()
                   (font-lock-mode 1)
                   (font-lock-fontify-buffer))))  ;; シンタックスカラーを即適用

;; 🛠️ Emmet (HTML/CSS の補完)
(use-package! emmet-mode
  :hook ((html-mode css-mode sgml-mode) . emmet-mode)
  :config
  (define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line))  ;; `C-j` で Emmet 展開

;; ⚡ Node.js / PHP のサポート
(use-package! nodejs-repl)
;;(use-package! php-mode)

;; 🗂️ 各言語のデフォルトモードを設定
(dolist (pair '(("\\.html?\\'" . html-mode)
;;                ("\\.php\\'" . php-mode)
                ("\\.ejs\\'" . js-mode)
                ("\\.vue\\'" . js-mode)
                ("\\.css\\'" . css-mode)
                ("\\.scss\\'" . scss-mode)
                ("\\.sass\\'" . sass-mode)
                ("\\.js\\'" . js-mode)
                ("\\.ts\\'" . typescript-mode)
                ("\\.json\\'" . json-mode)))
  (add-to-list 'auto-mode-alist pair))

;; 🧹 コード整形ツール (Prettier, Format-all)
(use-package! prettier-js
  :hook ((js-mode typescript-mode web-mode css-mode scss-mode json-mode) . prettier-js-mode))

(use-package! format-all
  :hook ((prog-mode . format-all-mode)
         (php-mode . format-all-mode)))  ;; PHP も `format-all` で整形可能

;; 🚀 Emacs から Vite を実行
(defun run-vite ()
  "Run Vite dev server inside Emacs."
  (interactive)
  (compile "npm run dev" t))

;; -----------------------------------------------
;; 🔧 ユーザーインターフェースの強化
;; -----------------------------------------------

;; which-key (キーバインドの補助)
(use-package! which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))  ;; 表示の遅延時間を短くする

;; nyan-mode (進捗バーを猫にする)
(use-package! nyan-mode
  :config
  (nyan-mode 1))

;; company (補完)
(use-package! company
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t))

;; Treemacs のキーバインドを F8 に設定
(map! :leader
      :desc "Toggle Treemacs" "t t" #'treemacs)
(global-set-key (kbd "<f8>") #'treemacs)

;; -----------------------------------------------
;; 📅 Org-mode の設定
;; -----------------------------------------------

;; org ファイルのディレクトリを iCloud に向ける
(setq org-directory "~/Documents/org/")
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file (expand-file-name "notes.org" org-directory))

(provide 'config)

;;; config.el ends here