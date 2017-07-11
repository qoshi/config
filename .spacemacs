;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; list of additional paths where to look for configuration layers.
   ;; paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; list of configuration layers to load. if it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     markdown
     yaml
     javascript
     swift
     ;; ----------------------------------------------------------------
     ;; example of useful layers you may want to use right away.
     ;; uncomment some layer names and press <spc f e r> (vim style) or
     ;; <m-m f e r> (emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     tabbar
     ;; better-defaults
     emacs-lisp
     ;;swift
     git
     html
     colors
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ivy
     ;; version-control
     )
   ;; list of additional packages that will be installed without being
   ;; wrapped in a layer. if you need some configuration for these
   ;; packages, then consider creating a layer. you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(company-sourcekit)
   ;; a list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; if non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "initialization function.
this function is called at the very startup of spacemacs initialization
before layers configuration.
you should not put any user code in there besides modifying the variable
values."
  ;; this setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; if non nil elpa repositories are contacted via https whenever it's
   ;; possible. set it to nil if you have no way to use https in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; this variable has no effect if emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; maximum allowed time in seconds to contact an elpa repository.
   dotspacemacs-elpa-timeout 5
   ;; if non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; one of `vim', `emacs' or `hybrid'. evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; if non nil output loading progress in `*messages*' buffer. (default nii18n_open_candidate_tooltip_titlel)
   dotspacemacs-verbose-loading nil
   ;; specify the startup banner. default value is `official', it displays
   ;; the official spacemacs logo. an integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. a string value must be a path to an image format supported
   ;; by your emacs build.
   ;; if the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner '998
   ;; list of items to show in the startup buffer. if nil it is disabled.
   ;; possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; number of recent files to show in the startup buffer. ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; list of themes, the first of the list is loaded when spacemacs starts.
   ;; press <spc> t n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; dotspacemacs-themes '(spacemacs-dark
   ;;                       spacemacs-light
   ;;                       solarized-light
   ;;                       solarized-dark
   ;;                       leuven
   ;;                       monokai
   ;;                       zenburn)
   ;; if non nil the cursor color matches the state color in gui emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("source code pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; the leader key
   ;; dotspacemacs-leader-key "spc"
   ;; the leader key accessible in `emacs state' and `insert state'
   ;; (default "m-m")
   ;; dotspacemacs-emacs-leader-key "m-m"
   ;; major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "c-m-m)
   ;; dotspacemacs-major-mode-emacs-leader-key "c-m-m"
   ;; these variables control whether separate commands are bound in the gui to
   ;; the key i18n_open_candidate_tooltip_titlepairs c-i, tab and c-m, ret.
   ;; setting it to a non-nil value, allows for separate commands under <c-i>
   ;; and tab or <c-m> and ret.
   ;; in the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the gui. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; the command key used for evil commands (ex-commands) and
   ;; emacs commands (m-x).
   ;; by default the command key is `:' so ex-commands are executed like in vim
   ;; with `:' and emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; if non nil `y' is remapped to `y$'. (default t)
   dotspacemacs-remap-y-to-y$ t
   ;; name of the default layout (default "default")
   dotspacemacs-default-layout-name "default"
   ;; if non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; if non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; location where to auto-save files. possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; if non nil then `ido' replaces `helm' for some commands. for now only
   ;; `find-files' (spc f f), `find-spacemacs-file' (spc f e s), and
   ;; `find-contrib-file' (spc f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; if non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; if non nil the paste micro-state is enabled. when enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; which-key delay in seconds. the which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; which-key frame position. possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; if non nil a progress bar is displayed when spacemacs is loading. this
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; if non nil the frame is fullscreen when emacs starts up. (default nil)
   ;; (emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; if non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; use to disable fullscreen animations in osx. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; if non nil the frame is maximized when emacs starts up.
   ;; takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; a value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; a value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; if non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; if non nil smooth scrolling (native-scrolling) is enabled. smooth
   ;; scrolling overrides the default behavior of emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; if non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. if set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; if non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; select a scope to highlight delimiters. possible values are `any',
   ;; `current', `all' or `nil'. default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; if non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; list of search tool executable names. spacemacs uses the first installed
   ;; tool of the list. supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; the default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; delete whitespace while saving buffer. possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   )
  ;;add rainbow mode hooks
  (add-hook 'prog-mode-hook 'rainbow-mode)
  ;;js and json ident
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  )

(defun dotspacemacs/user-init ()
  "initialization function for user code.
it is called immediately after `dotspacemacs/init', before layer configuration
executes.
 this function is mostly useful for variables that need to be set
before packages are loaded. if you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (defun iw ()
    (interactive)
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))
    )
  (add-hook 'web-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'iw)))
  ;;add web develop hooks
  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'web-beautify-js-buffer t t)))
  (add-hook 'js-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'web-beautify-js-buffer t t)))
  (add-hook 'json-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'web-beautify-js-buffer t t)))
  (add-hook 'html-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'web-beautify-html-buffer t t)))
  (add-hook 'css-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'web-beautify-css-buffer t t)))
  (global-linum-mode 1)
  (setq linum-format "%4d \u2502 ")
  )

(defun dotspacemacs/user-config ()
  "configuration function for user code.
this function is called at the very end of spacemacs initialization after
layers configuration.
this is the place where most of your configurations should be done. unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  ;;remove global-hl-line-mode
  (global-hl-line-mode -1)
  ;;replace hot key

  ;;window stuff
  (global-set-key (kbd"M-c") 'delete-window)
  (global-set-key (kbd"M--") 'split-window-vertically)
  (global-set-key (kbd"M-|") 'split-window-horizontally)
  (global-set-key (kbd"M-B") 'delete-other-windows)
  ;; set alt meta
;;  (setq alt 'meta)
  ;; when using darwin
  ;; set command as control
  ;; set meta meta
  ;; set controle command
  ;;  (when (eq system-type 'darwin)
    ;; (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
;;    )
  (if (display-graphic-p)
      (when (eq system-type 'darwin)
        (message "bala bala bal ")
        (set-keyboard-coding-system nil)
        (setq mac-option-modifier 'meta)
        (setq mac-command-modifier 'control)
        )
    )
  ;;mouse
  (xterm-mouse-mode t)
  (global-set-key [(mouse-4)] 'scroll-up)
  (global-set-key [(mouse-5)] 'scroll-down)
  (setq scroll-step 1)
  (global-set-key [(meta left)] 'backward-sexp)
  (global-set-key [(meta right)] 'forward-sexp)
  (global-set-key [(meta j)] 'tabbar-backward)
  (global-set-key [(meta k)] 'tabbar-forward)
  ;;goto line
  (global-set-key [(meta g)] 'goto-line)
  ;;comment region
  (defun my-comment-or-uncomment-region (beg end &optional arg)
    (interactive (if (use-region-p)
                     (list (region-beginning) (region-end) nil)
                   (list (line-beginning-position)
                         (line-beginning-position 2))))
    (comment-or-uncomment-region beg end arg)
    )
  (global-set-key (kbd"C-c .") 'my-comment-or-uncomment-region)
  ;;设置replace-string
  (global-set-key (kbd"<f2>") 'replace-string)
  (global-set-key (kbd"<f3>") 'replace-regexp)
  (global-set-key (kbd"<f4>") 'search-forward-regexp)
  ;; define a function copy one line
  (defun cp-one-line ()
    (interactive)
    (kill-ring-save (line-beginning-position) (line-end-position))
    )
  (global-set-key (kbd "C-c C-k") 'cp-one-line)
  ;;buffer loop
  ;; buferjunmping
  ;; next-buffer
  (defun nb ()
    (interactive)
    (other-window 1)
    )
  ;; previous-buffer
  (defun pb()
    (interactive)
    (other-window -1)
    )
  (global-set-key (kbd "M-{") 'pb)
  (global-set-key (kbd "M-}") 'nb)
  ;;rgrep
  (global-set-key (kbd"<f8>") 'rgrep)

  ;;something for golang
  ;;pop-tag-mark when using c-j trigger godef
  (global-set-key (kbd "C-c C-b") 'pop-tag-mark)

  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)
    ;;this make godef goimport can load pkg from GOPATH
    (exec-path-from-shell-copy-env "GOPATH")
    ;;  (exec-path-from-shell-copy-env "PATH")
    )
  (setq default-tab-width 4)
  (setq gofmt-command "goimports")

  ;; quick goto root path of a project
  (defun neotree-ffip-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))
  (neotree-toggle)
  ;; (neotree-projectile-action)
  (nb)
  ;; (global-set-key kbd("C-c C-o") 'neotree-enter-horizontal-split)
  ;; (global-set-key kbd("C-c C-t") 'neotree-enter-horizontal-split)
  ;; (global-set-key kbd("C-c C-f") 'neotree-find)
  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  ;; (define-key map (kbd "C-c C-p") 'neotree-ffip-project-dir)

  ;;swift hooks
  (add-hook 'swift-mode-hook (lambda() (
            ;; (require 'company-sourcekit)
            (company-mode 1)
            (add-to-list 'company-backends 'company-sourcekit)
            )))
  (unless (display-graphic-p)
    (setq linum-relative-format "%3s "))

  ;;chinese font
  ;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;   (set-fontset-font (frame-parameter nil 'font)
  ;;                     charset (font-spec :family "Microsoft Yahei" :size 16)))

  ;; Alternatively
  (unless (display-graphic-p (selected-frame))
    (setq linum-relative-format (concat linum-relative-format " "))
    )
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (winum pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict ace-pinyin pinyinlib wgrep smex ivy-hydra counsel-projectile counsel swiper ivy mmm-mode markdown-toc markdown-mode gh-md yaml-mode fuzzy sourcekit web-mode tagedit slim-mode scss-mode sass-mode rainbow-mode rainbow-identifiers pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data color-identifiers-mode company-sourcekit swift-mode tabbar ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smeargle restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox orgit org org-plus-contrib org-bullets open-junk-file neotree move-text magit-gitflow macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio go-guru go-eldoc gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree elisp-slime-nav dumb-jump f diminish define-word company-tern dash-functional tern company-statistics company-go go-mode company column-enforce-mode coffee-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit s peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build spacemacs-theme)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



