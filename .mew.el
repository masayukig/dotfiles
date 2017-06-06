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

;;
(setq mew-name "Masayuki Igawa") ;; (user-full-name)
(setq mew-user "masayuki") ;; (user-login-name)
(setq mew-mail-domain "igawa.io")
(setq mew-proto "%")

;; https://www.fastmail.com/help/technical/servernamesandports.html
(setq mew-smtp-server "smtp.fastmail.com")  ;; if not localhost
(setq mew-smtp-ssl-port "465")
(setq mew-smtp-ssl t)
(setq mew-imap-user "masayuki@igawa.io")  ;; (user-login-name)
(setq mew-imap-server "imap.fastmail.com")    ;; if not localhost
(setq mew-imap-ssl t)
(setq mew-imap-ssl-port "993")
(setq mew-prog-ssl "/usr/sbin/stunnel")
(setq mew-ssl-verify-level 0)

;; 1. パスワードをメモリに一時的に蓄える。ファイルには書き出さない。
;; 2. パスワードをメモリに Mew が起動している間中蓄える。Mew/Emacs の終了時に、 パスワードを暗号化しファイルに書き出す。
;; (setq mew-use-cached-passwd t)
(setq mew-use-master-passwd t)

(setq mew-imap-trash-folder "%Archive")

(provide '.mew)
;;; .mew.el ends here
