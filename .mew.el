;;; .mew.el ---                                      -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Masayuki Igawa

;; Author: Masayuki Igawa <masayuki@igawa.io>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:


;; signatureはメールの末尾に付ける
(setq mew-signature-insert-last t)

;;1行あたり70字で自動改行
(setq mew-draft-mode-hook
      (function (lambda ()
		  (auto-fill-mode 1)
		  (setq fill-column 70))))

;; https://www.mew.org/ja/info/release/mew_8.html#Customize
(setq mew-charset-m17n "utf-8")
;;
(setq mew-name "Masayuki Igawa") ;; (user-full-name)
(setq mew-user "masayuki") ;; (user-login-name)
(setq mew-mail-domain "igawa.io")
(setq mew-proto "%")

;; サーバの設定
(setq mew-config-alist
      '(;; 常用アカウント(default)の設定
	("default"
	 ("name"        . "Masayuki Igawa")
	 ("user"        . "masayuki")
	 ("mail-domain" . "igawa.io")
	 ("smtp-server" . "smtp.fastmail.com")
	 ("smtp-ssl"    . t)
	 ("smtp-ssl-port" . "465")
	 ("imap-server" . "imap.fastmail.com")
	 ("imap-user"   . "masayuki@igawa.io")
	 ("imap-ssl"    . t)
	 ("imap-ssl-port" . "993")
	 ;; もしSignature専用のファイルを作るなら、そのファイル名を
	 ("signature-file"  . ".signature.default")
	 )
         ;;; サブaccount
	("work"
	 ("name"        . "Masayuki Igawa")
	 ("user"        . "masayuki.igawa")
	 ("mail-domain" . "suse.com")
	 ("smtp-server" . "smtp.novell.com")
	 ("smtp-ssl"    . t)
	 ("smtp-port"   . "26")
	 ("smtp-ssl-port" . "26")
	 ("imap-server" . "imap.novell.com")
	 ("imap-user"   . "MIgawa")
	 ("imap-ssl"    . t)
	 ("imap-port" . "143")
	 ("imap-ssl-port" . "143")
	 ;; もしSignature専用のファイルを作るなら、そのファイル名を
	 ("signature-file"  . ".signature.work")
	 ;; ;; メールは受信してもサーバに残す
	 ;; ("pop-delete"  . nil)
	 ;; ;; APOP で受信
	 ;; ("pop-auth"    . apop)
	 ;;("pop-size"    . 0)
	 )
	))


;; https://www.fastmail.com/help/technical/servernamesandports.html
;; (setq mew-smtp-server "smtp.fastmail.com")  ;; if not localhost
;; (setq mew-smtp-ssl-port "465")
;; (setq mew-smtp-ssl t)
;; (setq mew-imap-user "masayuki@igawa.io")  ;; (user-login-name)
;; (setq mew-imap-server "imap.fastmail.com")    ;; if not localhost
;; (setq mew-imap-ssl t)
;; (setq mew-imap-ssl-port "993")
(setq mew-prog-ssl "/usr/sbin/stunnel")
(setq mew-ssl-verify-level 0)

;; 1. パスワードをメモリに一時的に蓄える。ファイルには書き出さない。
;; 2. パスワードをメモリに Mew が起動している間中蓄える。Mew/Emacs の終了時に、 パスワードを暗号化しファイルに書き出す。
;; (setq mew-use-cached-passwd t)
(setq mew-use-master-passwd t)

(setq mew-imap-trash-folder "%Archive")
(setq mew-fcc "%Sent")

(provide '.mew)
;;; .mew.el ends here
