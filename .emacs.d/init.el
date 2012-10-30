;; 言語を日本語
(set-language-environment 'Japanese)
;; UTF-8
(prefer-coding-system 'utf-8)

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
 (let (path)
   (dolist (path paths paths)
   	 (let ((default-directory
   	 	  (expand-file-name (concat user-emacs-directory path))))
   	 (add-to-list 'load-path default-directory)
   	 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
   	 	 (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")