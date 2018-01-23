
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

(global-set-key "\C-h" 'backward-delete-char)
(global-set-key (kbd "C-x g") 'magit-status)

(transient-mark-mode 1)

(setq my-frame-alist
      '(
	(top . 30)
	(left . 40)
	;; for 12px font
          (height . 60)
          (width . 130)
          ;; for 14px font
          ;; (height . 39)
          ;; (width . 156)
          (foreground-color . "LightGray")
          (background-color . "Black")
          (cursor-color . "Gray")
          (tool-bar-lines . nil)))
(setq initial-frame-alist my-frame-alist)
(setq default-frame-alist my-frame-alist)

;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 90)
   ))

;; 無駄な空行に気付きやすくする
(setq-default indicate-empty-lines t)

;; 対応する括弧を表示
(show-paren-mode t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; delete-trailing-whitespace when saving
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ;;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; ;;; Highlight tabs
;; (add-hook 'font-lock-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords
;;              nil
;;              '(("\t" 0 'trailing-whitespace prepend)))))

;; ;;; disable-trailing-mode
;; ;;; http://qiita.com/tadsan/items/df73c711f921708facdc
;; (defun my/disable-trailing-mode-hook ()
;;   "Disable show tail whitespace."
;;   (setq show-trailing-whitespace nil))

;; (defvar my/disable-trailing-modes
;;   '(comint-mode
;;     eshell-mode
;;     eww-mode
;;     term-mode
;;     mew-draft-mode
;;     ))

;; (mapc
;;  (lambda (mode)
;;    (add-hook (intern (concat (symbol-name mode) "-hook"))
;;              'my/disable-trailing-mode-hook))
;;  my/disable-trailing-modes)


;;; do not create auto-save file;;;
(setq auto-save-default nil)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; auto line feed settings
;;; http://somemo.hatenablog.com/entry/2012/05/01/140505
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

(defun turn-on-auto-fill ()
  "Unconditionally turn on Auto Fill mode."
  (auto-fill-mode 1))

(defun turn-off-auto-fill ()
  "Unconditionally turn off Auto Fill mode."
  (auto-fill-mode -1))

(custom-add-option 'text-mode-hook 'turn-on-auto-fill)
;;; 0: immediately
;;; nil: none
(setq fill-column 0)
;(setq fill-column nil)


;;; 強力な補完機能を使う
;;; p-bでprint-bufferとか
;;(load "complete")
;; 24では、デフォルト有効らしい
;;(partial-completion-mode t)
;; 部分一致の補完機能を使う
;; p-bでprint-bufferとか
;; 2012-08-08
;; Emacs 24ではデフォルトで有効になっていて、`partial-completion-mode'は
;; なくなっている。カスタマイズする場合は以下の変数を変更する。
;;   * `completion-styles'
;;   * `completion-pcm-complete-word-inserts-delimiters'
(if (fboundp 'partial-completion-mode)
    (partial-completion-mode t))

;;; 補完可能なものを随時表示
;;; 少しうるさい
(icomplete-mode 1)

;;; キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
(define-key global-map "\C-z" 'undo)                 ; undo
(define-key global-map "\C-ci" 'indent-region)       ; インデント
(define-key global-map "\C-c\C-i" 'dabbrev-expand)   ; 補完
(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(define-key global-map "\C-o" 'toggle-input-method)  ; 日本語入力切替
(define-key global-map "\C-\\" nil) ; \C-\の日本語入力の設定を無効にする
(define-key global-map "\C-c " 'other-frame)         ; フレーム移動

;;; set indentation for javascript
;;; https://qiita.com/sawamur@github/items/1eeacf63551c1215a1cd
(setq js-indent-level 2)

;;; untabify
;;; https://www.emacswiki.org/emacs/NoTabs
(setq-default indent-tabs-mode nil)

;;; カーソルの点滅を止める
(blink-cursor-mode 0)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; スクロールを一行ずつにする
(setq scroll-step 1)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
;;(setq kill-whole-line t)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;; 一行が 80 字以上になった時には自動改行する
(setq fill-column 80)
(setq-default auto-fill-mode t)

;;; emacs -nw で起動した時にメニューバーを消す
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; 圧縮されたファイルも編集できるようにする
(auto-compression-mode t)

;;; emacsclient サーバを起動
(server-start)

;;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;; モードラインに時間を表示する
(display-time)

;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;;; 略語定義ファイルの読み込み
;;; ~/site-lisp/.abbrev_defsが存在していなかったら読み込まない
(let ((file "~/site-lisp/.abbrev_defs"))
  (setq abbrev-file-name file)
  (if (file-exists-p file)
      (quietly-read-abbrev-file file)))

;;; 略語定義が変更されていたら黙って保存
(setq save-abbrevs 'silently)

;;; デフォルトでAbbrevモードにする
(setq default-abbrev-mode t)

;;; 最終更新日の自動挿入
;;;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される

;; (require 'time-stamp)

;; ;; 日本語で日付を入れたくないのでlocaleをCにする
;; (defun time-stamp-with-locale-c ()
;;   (let ((system-time-locale "C"))
;;     (time-stamp)
;;     nil))

;; (if (not (memq 'time-stamp-with-locale-c write-file-hooks))
;;     (add-hook 'write-file-hooks 'time-stamp-with-locale-c))

;; (setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")

;;; 画像ファイルを表示する
(auto-image-file-mode t)

;;; 自動でファイルを挿入する
(auto-insert-mode t)

;;; セッションを保存する
;;; 初めは手動でM-x desktop-saveしなければいけない
;;(desktop-load-default)
;;(desktop-read)

;;; 次のGCまでに使用可能なバイト数
(setq gc-cons-threshold 4096000)

;; 最近使ったファイルを保存(M-x recentf-open-filesで開く)
;(recentf-mode)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
;; Rinari
;(add-to-list 'load-path "~/elisp/rinari")
;(require 'rinari)

;;; rhtml-mode
;(add-to-list 'load-path "~/elisp/rhtml")
;(require 'rhtml-mode)
;(add-hook 'rhtml-mode-hook
;    (lambda () (rinari-launch)))

(setq show-paren-style 'mixed)
;(set-face-background 'show-paren-match-face "gray10")
;(set-face-foreground 'show-paren-match-face "SkyBlue")

(setq-default tab-width 8)
(defun my-c-mode-hook ()
  (c-set-style "linux")
  (setq tab-width 8)
  (setq c-basic-offset tab-width)
;  (turn-on-font-lock)
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
;(my-c-mode-hook)

(add-hook 'python-mode-hook
          (lambda ()
            (flyspell-prog-mode
             )))
(add-hook 'text-mode-hook
          (lambda ()
            (flyspell-prog-mode
             )))


;; THIS DOESN'T WORK SO FAR...
;; ;; load python-mode
;; ;; https://qiita.com/ynakayama/items/e5ec9b53ae6eeec4fa6e
;; (when (autoload 'python-mode "python-mode" "Python editing mode." t)
;;   ;; Enable python-pep8 keybinds when python-mode is on
;;   (setq python-mode-hook
;;         (function (lambda ()
;;                     (local-set-key "\C-c\ p" 'python-pep8))))
;;   (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;;   (setq interpreter-mode-alist (cons '("python" . python-mode)
;;                                      interpreter-mode-alist)))


; http://qiita.com/tukiyo3/items/86bec536da566cec8acd
;;tramp
(add-to-list 'load-path "~/emacs/tramp/lisp/")
(require 'tramp)

;; Feel time flies
;; https://qiita.com/zk_phi/items/11a419911db861b9211e
;; https://github.com/zk-phi/sky-color-clock

(add-to-list 'load-path "~/git/sky-color-clock")
(require 'sky-color-clock)
(sky-color-clock-initialize 35) ;; initialize with Tokyo latitude
;; Add sky-color-clock to mode-line-format
(push '(:eval (sky-color-clock)) (default-value 'mode-line-format))
;; Moon age
(setq sky-color-clock-enable-emoji-icon t)
(sky-color-clock-initialize-openweathermap-client "2c62cc715ee5bfc78647b7b3874a5202" 1850144)
(setq sky-color-clock-enable-temperature-indicator t)


;; w3m
(require 'w3m-load)

;; https://github.com/clear-code/emacs.d/blob/master/init.el
;;; 履歴
;; 履歴数を大きくする
(setq history-length 1000)
;; ミニバッファの履歴を保存する
(savehist-mode 1)
;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 1000)

;; CommandとOptionを入れ替える
;; http://qiita.com/usobuku/items/39342e2a4137dde894b4
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; hl-line-mode
(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for Mew
;; https://www.mew.org/ja/info/release/mew_1.html#Overview
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for Neotree
;; https://www.emacswiki.org/emacs/NeoTree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/git/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/domtronn/all-the-icons.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path "~/git/all-the-icons.el")
;;(require 'all-the-icons)
;; or
;; (use-package all-the-icons)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown-mode
;; https://jblevins.org/projects/markdown-mode/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (package-initialize)

;; (use-package markdown-mode
;;              :ensure t
;;              :commands (markdown-mode gfm-mode)
;;              :mode (("README\\.md\\'" . gfm-mode)
;;                     ("\\.md\\'" . markdown-mode)
;;                     ("\\.markdown\\'" . markdown-mode))
;;              :init (setq markdown-command "multimarkdown"))
(add-to-list 'load-path "~/git/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;; put line number on left side
(global-linum-mode t)
;; reserve for 5 digits
(setq linum-format "%5d ")


;;;;;;;;;;;;;;;;;;;;;
;; for scala-mode
;; http://d.hatena.ne.jp/tototoshi/20100925/1285420294
;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/scala-mode")
;; (require 'scala-mode-auto)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(package-selected-packages (quote (popwin magit popwin google-translate marmalade-demo ##)))
 '(show-paren-mode t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/magit/magit/issues/1479
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'git-commit-setup-hook
          (lambda ()
            (add-hook 'with-editor-pre-finish-hook
                      'git-commit-save-message nil t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Marmalade package setting
;; https://marmalade-repo.org/#httpsinstructions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Melpa package setting (for magit)
;; https://magit.vc/manual/magit/Installing-from-an-Elpa-Archive.html#Installing-from-an-Elpa-Archive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; key bindings
;; https://magit.vc/manual/magit/Editing-commit-messages.html
;; C-c C-c     (with-editor-finish)
;; C-c C-k     (with-editor-cancel)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Popwin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

;; This doesn't work so far... :(
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; google-translate
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'google-translate)

;; (global-set-key "\C-xt" 'google-translate-at-point)
;; (global-set-key "\C-xT" 'google-translate-query-translate)

;; ;; Set the default languages of translation (en -> ja)
;; ;; disable by C-u
;; (custom-set-variables
;;  '(google-translate-default-source-language "en")
;;  '(google-translate-default-target-language "ja"))

;; ;; Use popwin google-translate.el buffer
;; (push '("*Google Translate*") popwin:special-display-config)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 88 :width normal :foundry "unknown" :family "IPA \343\203\242\343\203\212\343\203\274 \343\202\264\343\202\267\343\203\203\343\202\257")))))
