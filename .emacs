(set-language-environment "Japanese")

(global-set-key "\C-h" 'backward-delete-char)

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

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 強力な補完機能を使う
;;; p-bでprint-bufferとか
;;(load "complete")
(partial-completion-mode 1)

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

;;;;;;;;;;;;;;;;;;;;;
;; for scala-mode
;; http://d.hatena.ne.jp/tototoshi/20100925/1285420294
;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(require 'scala-mode-auto)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(transient-mark-mode t))
 (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#1a1a1a" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 88 :width normal :foundry "unknown" :family "IPA \343\203\242\343\203\212\343\203\274 \343\202\264\343\202\267\343\203\203\343\202\257")))))
  '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 88 :width normal :foundry "unknown" :family "IPA \343\203\242\343\203\212\343\203\274 \343\202\264\343\202\267\343\203\203\343\202\257")))))
