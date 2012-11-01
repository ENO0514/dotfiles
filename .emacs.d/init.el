;; 文字コードを指定する
;; 言語を日本語
(set-language-environment "Japanese")
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

;; キーバインド

;; C-m にnewline-and-indentを割り当てる
(define-key global-map (kbd "C-m") 'newline-and-indent)

;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; C-t でウィンドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window) 

;; パスの設定
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")

;; ファイル名の扱い(Mac OS)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;; カラム番号/行番号も表示
(column-number-mode t)
(line-number-mode t)

;; ファイルサイズを表示
(size-indication-mode t)
;; 時計を表示
(display-time-mode t)
;; バッテリー残量を表示
(display-battery-mode t)

;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
      ;; これだとエコーエリアがチラつく
      ;;(count-lines-region (region-beginning) (region-end))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;; タイトルバーにバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;　行番号を常に表示する
(global-linum-mode t)

;; TABの表示幅
(setq-default tab-width 4)

;; C,C++,Java,PHPなどのインデント
(add-hook 'c-mode-common-hook
	  (lambda ()
             (c-set-style "bsd" )))

;; リージョンの背景色を変更
(set-face-background 'region "darkgreen")

;; color-theme
(when (require 'color-theme nil t)

;; テーマを読み込むための設定
(color-theme-initialize)
;; テーマをhoberに変更する
(color-theme-hober))

;; asciiフォントをMenloに
(when (eq window-system 'ns)
(set-face-attribute 'default nil
					:family "Menlo"
					:height 120)
;; 日本語フォントを指定する
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "ヒラギノ明朝 Pro"))

;; ひらがなとカタカナをモトヤシーダに
(set-fontset-font
 nil '(#x3040 . #x30ff)
 (font-spec :family "NfMotoyaCedar"))

;;フォントの横幅を調節する
(setq face-font-rescale-alist
	  '((".*Menlo.*" .1.0)
	    (".*Hiragino_Mincho_Pro.*".1.2)
		(".*nfmotoyacedar.*".1.2)
		(".*nfmotoyaceder-medium.*".1.2)
		("-cdac$" . 1.3))))


;; 現在行のハイライト
(defface my-hl-line-face
    ;; 背景がdarkならば背景色を紺に
    '((((class color) (background dark))
	        (:background "NavyBlue" t))
	      ;; 背景がlightならば背景色を緑に
	      (((class color) (background light))
		        (:background "brightwhite" t))
		      (t (:bold t)))
	  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 対応する括弧のハイライト
;; paren-mode：対応する括弧を強調して表示する
(setq show-paren-delay 0) ; 表示までの秒数。初期値は0.125
(show-paren-mode t) ; 有効化
;; parenのスタイル: expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; バックアップとオートセーブファイルをbackupsへ集める
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
	  `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; ファイルが#!から始まる場合、+xをつけて保存する
(add-hook 'after-save-hook
		  'executable-make-buffer-file-executable-if-script-p)

;; emacs-lisp-modeのフックをセット
(defun elisp-mode-hooks ()
    "lisp-mode-hooks"
	  (when (require 'eldoc nil t)
		    (setq eldoc-idle-delay 0.2)
			    (setq eldoc-echo-area-use-multiline-p t)
				    (turn-on-eldoc-mode)))

;; auto-installの設定
(when (require 'auto-install nil t); 
    ;; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
    (setq auto-install-directory "~/.emacs.d/elisp/")
	  ;; EmacsWikiに登録されているelisp の名前を取得する
	  (auto-install-update-emacswiki-package-name t)
	    ;; 必要であればプロキシの設定を行う
	    ;; (setq url-proxy-services '(("http" . "localhost:8339")))
	    ;; install-elisp の関数を利用可能にする
	    (auto-install-compatibility-setup))

;; repo+を利用する
;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(when (require 'redo+ nil t)
    ;; C-' にリドゥを割り当てる
    (global-set-key (kbd "C-'") 'redo)
	  ;; 日本語キーボードの場合C-. などがよいかも
	  ;; (global-set-key (kbd "C-.") 'redo)
	)

;; packade.elの設定
(when (require 'package nil t)
    ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
    (add-to-list 'package-archives
				                '("marmalade" . "http://marmalade-repo.org/packages/"))
	  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
	    ;; インストールしたパッケージにロードパスを通して読み込む
	    (package-initialize))

;; anything.el
;; (auto-install-batch "anything")
(when (require 'anything nil t)
    (setq
	    ;; 候補を表示するまでの時間。デフォルトは0.5
	    anything-idle-delay 0.3
		   ;; タイプして再描写するまでの時間。デフォルトは0.1
		   anything-input-idle-delay 0.2
		      ;; 候補の最大表示数。デフォルトは50
		      anything-candidate-number-limit 100
			     ;; 候補が多いときに体感速度を早くする
			     anything-quick-update t
				    ;; 候補選択ショートカットをアルファベットに
				    anything-enable-shortcuts 'alphabet)

	  (when (require 'anything-config nil t)
		    ;; root権限でアクションを実行するときのコマンド
		    ;; デフォルトは"su"
		    (setq anything-su-or-sudo "sudo"))

	    (require 'anything-match-plugin nil t)

		  (when (and (executable-find "cmigemo")
					              (require 'migemo nil t))
			    (require 'anything-migemo nil t))

		    (when (require 'anything-complete nil t)
			      ;; lispシンボルの補完候補の再検索時間
			      (anything-lisp-complete-symbol-set-timer 150))

			  (require 'anything-show-completion nil t)

			    (when (require 'auto-install nil t)
				      (require 'anything-auto-install nil t))

				  (when (require 'descbinds-anything nil t)
					    ;; describe-bindingsをAnythingに置き換える
					    (descbinds-anything-install)))

;; auto-completeの設定
(when (require 'auto-complete-config nil t)
    (add-to-list 'ac-dictionary-directories
				     "~/.emacs.d/elisp/ac-dict")
	  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
	    (ac-config-default))


;; color-moccurの設定
(when (require 'color-moccur nil t)
    ;; M-oにoccur-by-moccurを割り当て
    (define-key global-map (kbd "M-o") 'occur-by-moccur)
	  ;; スペース区切りでAND検索
	  (setq moccur-split-word t)
	    ;; ディレクトリ検索のとき除外するファイル
	    (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
		  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
		    ;; Migemoを利用できる環境であればMigemoを使う
		    (when (and (executable-find "cmigemo")
					                (require 'migemo nil t))
			      (setq moccur-use-migemo t)))

;; moccur-editの設定
(require 'moccur-edit nil t)

;; moccur-edit-finish-editと同時にファイルを保存する
(defadvice moccur-edit-change-file
   (after save-after-moccur-edit-buffer activate)
   (save-buffer))

;; wgrepの設定
(require 'wgrep nil t)

;; undohistの設定
(when (require 'undohist nil t)
   (undohist-initialize)

;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undoの設定
(when (require 'point-undo nil t)
    ;; (define-key global-map [f5] 'point-undo)
    ;; (define-key global-map [f6] 'point-redo)
    ;; 筆者のお勧めキーバインド
    (define-key global-map (kbd "M-[") 'point-undo)
	  (define-key global-map (kbd "M-]") 'point-redo)
	    )

;; ElScreenのプレフィックスキーを変更する（初期値はC-z）
;; (setq elscreen-prefix-key (kbd "C-t"))
(when (require 'elscreen nil t)
    ;; C-z C-zをタイプした場合にデフォルトのC-zを利用する
    (if window-system
		      (define-key elscreen-map (kbd "C-z") 'iconify-or-deiconify-frame)
	      (define-key elscreen-map (kbd "C-z") 'suspend-emacs)))


;; howmメモ保存の場所
(setq howm-directory (concat user-emacs-directory "howm"))
;; howm-menuの言語を日本語に
(setq howm-menu-lang 'ja)
;; howmメモを1日1ファイルにする
; (setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-modeを読み込む
(when (require 'howm-mode nil t)
    ;; C-c,,でhowm-menuを起動
    (define-key global-map (kbd "C-c ,,") 'howm-menu))
;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
    "howmメモを保存と同時に閉じます。"
	  (interactive)
	    (when (and (buffer-file-name)
				                (string-match "\\.howm" (buffer-file-name)))
		      (save-buffer)
			      (kill-buffer nil)))

;; C-c C-cでメモの保存と同時にバッファを閉じる
(define-key howm-mode-map (kbd "C-c C-c") 'howm-save-buffer-and-kill)

;; cua-modeの設定
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ; CUAキーバインドを無効にする

;; HTML編集のデフォルトモードをnxml-modeにする
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . nxml-mode))

;; HTML5
(eval-after-load "rng-loc"
    '(add-to-list 'rng-schema-locating-files "~/.emacs.d/public_repos/html5-el/schemas.xml"))
(require 'whattf-dt)

;; </を入力すると自動的にタグを閉じる
(setq nxml-slash-auto-complete-flag t)
;; M-TABでタグを補完する
(setq nxml-bind-meta-tab-to-complete-flag t)
;; nxml-modeでauto-complete-modeを利用する
(add-to-list 'ac-modes 'nxml-mode)
;; 子要素のインデント幅を設定する。初期値は2
(setq nxml-child-indent 0)
;; 属性値のインデント幅を設定する。初期値は4
(setq nxml-attribute-indent 0)


;; cssm-modeの基本設定
(defun css-mode-hooks ()
    "css-mode hooks"
	  ;; インデントをCスタイルにする
	  (setq cssm-indent-function #'cssm-c-style-indenter)
	    ;; インデント幅を2にする
	    (setq cssm-indent-level 2)
		  ;; インデントにタブ文字を使わない
		  (setq-default indent-tabs-mode nil)
		    ;; 閉じ括弧の前に改行を挿入する
		    (setq cssm-newline-before-closing-bracket ))

(add-hook 'css-mode-hook 'css-mode-hooks)

;; js-modeの基本設定
(defun js-indent-hook ()
    ;; インデント幅を4にする
    (setq js-indent-level 2
		          js-expr-indent-offset 2
				          indent-tabs-mode nil)
	  ;; switch文のcaseラベルをインデントする関数を定義する
	  (defun my-js-indent-line () ; ←1●
		    (interactive)
			    (let* ((parse-status (save-excursion (syntax-ppss (point-at-bol))))
					              (offset (- (current-column) (current-indentation)))
								             (indentation (js--proper-indentation parse-status)))
				        (back-to-indentation)
						      (if (looking-at "case\\s-")
								            (indent-line-to (+ indentation 2))
								        (js-indent-line))
							        (when (> offset 0) (forward-char offset))))
	    ;; caseラベルのインデント処理をセットする
	    (set (make-local-variable 'indent-line-function) 'my-js-indent-line)
		  ;; ここまでcaseラベルを調整する設定
		  )

;; js-modeの起動時にhookを追加
(add-hook 'js-mode-hook 'js-indent-hook)

;; php-modeの設定
(when (require 'php-mode nil t)
    (add-to-list 'auto-mode-alist '("\\.ctp\\'" . php-mode))
	  (setq php-search-url "http://jp.php.net/ja/")
	    (setq php-manual-url "http://jp.php.net/manual/ja/"))

;; php-modeのインデント設定
(defun php-indent-hook ()
    (setq indent-tabs-mode nil)
	  (setq c-basic-offset 4)
	    ;; (c-set-offset 'case-label '+) ; switch文のcaseラベル
	    (c-set-offset 'arglist-intro '+) ; 配列の最初の要素が改行した場合
		  (c-set-offset 'arglist-close 0)) ; 配列の閉じ括弧

 (add-hook 'php-mode-hook 'php-indent-hook)

;; php-modeの補完を強化する
(defun php-completion-hook ()
    (when (require 'php-completion nil t)
	      (php-completion-mode t)
		      (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)

			      (when (require 'auto-complete nil t)
					    (make-variable-buffer-local 'ac-sources)
						    (add-to-list 'ac-sources 'ac-source-php-completion)
							    (auto-complete-mode t))))

(add-hook 'php-mode-hook 'php-completion-hook)

;; perl-modeをcperl-modeのエイリアスにする
(defalias 'perl-mode 'cperl-mode)

;; cperl-modeのインデント設定
(setq cperl-indent-level 4 ; インデント幅を4にする
	        cperl-continued-statement-offset 4 ; 継続する文のオフセット※
			      cperl-brace-offset -4 ; ブレースのオフセット
				        cperl-label-offset -4 ; labelのオフセット
						      cperl-indent-parens-as-block t ; 括弧もブロックとしてインデント
							        cperl-close-paren-offset -4 ; 閉じ括弧のオフセット
									      cperl-tab-always-indent t ; TABをインデントにする
										        cperl-highlight-variables-indiscriminately t) ; スカラを常にハイライトする


;; yaml-modeの設定
(when (require 'yaml-mode nil t)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))

;; perl-completionの設定
(defun perl-completion-hook ()
    (when (require 'perl-completion nil t)
	      (perl-completion-mode t)
		      (when (require 'auto-complete nil t)
				      (auto-complete-mode t)
					        (make-variable-buffer-local 'ac-sources)
							      (setq ac-sources
										            '(ac-source-perl-completion)))))

(add-hook  'cperl-mode-hook 'perl-completion-hook)

;; ruby-modeのインデント設定
(setq ;; ruby-indent-level 3 ; インデント幅を3に。初期値は2
       ruby-deep-indent-paren-style nil ; 改行時のインデントを調整する
	         ;; ruby-mode実行時にindent-tabs-modeを設定値に変更
	         ;; ruby-indent-tabs-mode t ; タブ文字を使用する。初期値はnil
	         )

;; 括弧の自動挿入──ruby-electric
(require 'ruby-electric nil t)
;; endに対応する行のハイライト──ruby-block
(when (require 'ruby-block nil t)
    (setq ruby-block-highlight-toggle t))
;; インタラクティブRubyを利用する──inf-ruby
(autoload 'run-ruby "inf-ruby"
    "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
    "Set local key defs for inf-ruby in ruby-mode")

;; ruby-mode-hook用の関数を定義
(defun ruby-mode-hooks ()
    (inf-ruby-keys)
	  (ruby-electric-mode t)
	    (ruby-block-mode t))
;; ruby-mode-hookに追加
(add-hook 'ruby-mode-hook 'ruby-mode-hooks)

;; Makefileの種類を定義
(defvar flymake-makefile-filenames
    '("Makefile" "makefile" "GNUmakefile")
	  "File names for make.")

;; Makefileがなければコマンドを直接利用するコマンドラインを生成
(defun flymake-get-make-gcc-cmdline (source base-dir)
    (let (found)
	      (dolist (makefile flymake-makefile-filenames)
			      (if (file-readable-p (concat base-dir "/" makefile))
					            (setq found t)))
		      (if found
				  (list "make"
						(list "-s"
							  "-C"
							  base-dir
							  (concat "CHK_SOURCES=" source)
							  "SYNTAX_CHECK_MODE=1"																										                    "check-syntax"))
				      (list (if (string= (file-name-extension source) "c") "gcc" "g++")
							            (list "-o"
										"/dev/null"
										"-fsyntax-only"
										"-Wall"
									    source)))))

;; Flymake初期化関数の生成
(defun flymake-simple-make-gcc-init-impl
    (create-temp-f use-relative-base-dir
				                    use-relative-source build-file-name get-cmdline-f)
	  "Create syntax check command line for a directly checked source file.
Use CREATE-TEMP-F for creating temp copy."
	    (let* ((args nil)
			            (source-file-name buffer-file-name)
						         (buildfile-dir (file-name-directory source-file-name)))
		      (if buildfile-dir
				          (let* ((temp-source-file-name
								                  (flymake-init-create-temp-buffer-copy create-temp-f)))
							          (setq args
								      (flymake-get-syntax-check-program-args
						               temp-source-file-name
					                   buildfile-dir
					                   use-relative-base-dir
					                   use-relative-source
					                   get-cmdline-f))))
			  args))

;; 初期化関数を定義
(defun flymake-simple-make-gcc-init ()
    (message "%s" (flymake-simple-make-gcc-init-impl
				                    'flymake-create-temp-inplace t t "Makefile"
									                 'flymake-get-make-gcc-cmdline))
	  (flymake-simple-make-gcc-init-impl
	      'flymake-create-temp-inplace t t "Makefile"
		     'flymake-get-make-gcc-cmdline))

;; 拡張子 .c, .cpp, c++などのときに上記の関数を利用する
(add-to-list 'flymake-allowed-file-name-masks
			              '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
							               flymake-simple-make-gcc-init))

;; XML用Flymakeの設定
(defun flymake-xml-init ()
    (list "xmllint" (list "--valid"
						                          (flymake-init-create-temp-buffer-copy
												                            'flymake-create-temp-inplace))))

;; HTML用Flymakeの設定
(defun flymake-html-init ()
    (list "tidy" (list (flymake-init-create-temp-buffer-copy
						                      'flymake-create-temp-inplace))))

(add-to-list 'flymake-allowed-file-name-masks
			              '("\\.html\\'" flymake-html-init))

;; tidy error pattern
(add-to-list 'flymake-err-line-patterns
			 '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
			     nil 1 2 4))

;; JS用Flymakeの初期化関数の定義
(defun flymake-jsl-init ()
    (list "jsl" (list "-process" (flymake-init-create-temp-buffer-copy
								                                  'flymake-create-temp-inplace))))
;; JavaScript編集でFlymakeを起動する
(add-to-list 'flymake-allowed-file-name-masks
			              '("\\.js\\'" flymake-jsl-init))

(add-to-list 'flymake-err-line-patterns
			  '("^\\(.+\\)(\\([0-9]+\\)): \\(.*warning\\|SyntaxError\\): \\(.*\\)"
				   1 2 nil 4))

;; Ruby用Flymakeの設定
(defun flymake-ruby-init ()
    (list "ruby" (list "-c" (flymake-init-create-temp-buffer-copy
							                            'flymake-create-temp-inplace))))

(add-to-list 'flymake-allowed-file-name-masks
			              '("\\.rb\\'" flymake-ruby-init))

(add-to-list 'flymake-err-line-patterns
			              '("\\(.*\\):(\\([0-9]+\\)): \\(.*\\)" 1 2 nil 3))

;; Python用Flymakeの設定
 (install-elisp "https://raw.github.com/seanfisk/emacs/sean/src/flymake-python.el")
(when (require 'flymake-python nil t)
    ;; flake8を利用する
    ;;(when (executable-find "flake8")
	  ;;    (setq flymake-python-syntax-checker "flake8"))
	  ;; pep8を利用する
	   (setq flymake-python-syntax-checker "pep8")
	  )

;; gtags-modeのキーバインドを有効化する
(setq gtags-suggested-key-mapping t) ; 無効化する場合はコメントアウト
(require 'gtags nil t)

;; ctags.elの設定
(require 'ctags nil t)
(setq tags-revert-without-query t)

;; ctagsを呼び出すコマンドライン。パスが通っていればフルパスでなくてもよい
;; etags互換タグを利用する場合はコメントを外す
;; (setq ctags-command "ctags -e -R ")
;; anything-exuberant-ctags.elを利用しない場合はコメントアウトする
(setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")
(global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)

;; AnythingからTAGSを利用しやすくするコマンド作成
(when (and (require 'anything-exuberant-ctags nil t)
		              (require 'anything-gtags nil t))
    ;; anything-for-tags用のソースを定義
    (setq anything-for-tags
		          (list anything-c-source-imenu
						              anything-c-source-gtags-select
									                ;; etagsを利用する場合はコメントを外す
									                ;; anything-c-source-etags-select
									                anything-c-source-exuberant-ctags-select
													              ))

	  ;; anything-for-tagsコマンドを作成
	  (defun anything-for-tags ()
		    "Preconfigured `anything' for anything-for-tags."
			    (interactive)
				    (anything anything-for-tags
							                (thing-at-point 'symbol)
											              nil nil nil "*anything for tags*"))

	    ;; M-tにanything-for-currentを割り当て
	    (define-key global-map (kbd "M-t") 'anything-for-tags))

;; rhtmlの設定
(when (require 'rhtml-mode nil t)
    (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode)))

;; SQLサーバーへ接続するためのデフォルト情報
;;(setq sql-user "root"
;;	  sql-database "mytable"
;;	  sql-server "localhost"
;;	  sql-product "mysql")

;; Subversionフロントエンド psvn
(when (executable-find "svn")
    (setq svn-status-verbose nil)
	  (autoload 'svn-status "psvn" "Run `svn status'." t))

;; GitフロントエンドEggの設定
(when (executable-find "git")
    (require 'egg nil t))

;; キャッシュを作成
(setq woman-cache-filename "~/.emacs.d/.wmncach.el")
;; manパスを設定
(setq woman-manpath '("/usr/share/man"
					                        "/usr/local/share/man"
											                      "/usr/local/share/man/ja"))

;; anything-for-document用のソースを定義
(setq anything-for-document-sources
	        (list anything-c-source-man-pages
				              anything-c-source-info-cl
							              anything-c-source-info-pages
										              anything-c-source-info-elisp
													              anything-c-source-apropos-emacs-commands
																              anything-c-source-apropos-emacs-functions
																			              anything-c-source-apropos-emacs-variables))

;; anything-for-documentコマンドを作成
(defun anything-for-document ()
    "Preconfigured `anything' for anything-for-document."
	  (interactive)
	    (anything anything-for-document-sources
				              (thing-at-point 'symbol) nil nil nil
							              "*anything for document*"))

;; Command+dにanything-for-documentを割り当て
(define-key global-map (kbd "s-d") 'anything-for-document)
