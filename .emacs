;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                         ("melpa" . "https://melpa.org/packages/")))
;; Using china mirrors.
(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("eb122e1df607ee9364c2dfb118ae4715a49f1a9e070b9d2eb033f1cefd50a908" "1f35dedbeacbfe9ed72810478836105b5617da67ca27f717a29bbb8087e8a1ba" "8f567db503a0d27202804f2ee51b4cd409eab5c4374f57640317b8fcbbd3e466" "16ab866312f1bd47d1304b303145f339eac46bbc8d655c9bfa423b957aa23cc9" "30b14930bec4ada72f48417158155bc38dd35451e0f75b900febd355cda75c3e" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" default))
 '(inhibit-startup-screen t)
 '(org-agenda-files '("/mnt/c/Documents/Qosmos/qosmos_notes.org"))
 '(package-selected-packages
   '(org-tree-slide-pauses org-tree-slide evil-leader valign org-bullets flatland-theme flatland-black-theme molokai-theme clues-theme gruber-darker-theme afternoon-theme cyberpunk-theme monokai-pro-theme spacemacs-theme dracula-theme highlight-indent-guides magit undo-tree rainbow-delimiters linum-relative posframe pyim badwolf-theme airline-themes powerline)))

(defun remove-gui-elements ()
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
    (menu-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1)))

;(set-frame-parameter nil 'fullscreen 'maximized)
(remove-gui-elements)

(global-display-line-numbers-mode)

(load-theme 'dracula t)

(require 'org-tree-slide)
(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

(require 'powerline)
(powerline-default-theme)

(require 'airline-themes)
(load-theme 'airline-desertink t)

;; Hide Evil and buffer state on inactive buffers.
;; Valid Values: t (hidden), nil (shown)
(setq airline-hide-state-on-inactive-buffers t)

;; "Hide eyebrowse indicator on inactive buffers.
;; Valid Values: t (hidden), nil (shown)"
(setq airline-hide-eyebrowse-on-inactive-buffers t)

;; Hide vc branch on inactive buffers:
;; Valid Values: t (hidden), nil (shown)
(setq airline-hide-vc-branch-on-inactive-buffers nil)

;; Set eshell prompt colors to match the airline theme.
;; Valid Values: t (enabled), nil (disabled)
(setq airline-eshell-colors t)

;; Set helm colors to match the airline theme.
;; Valid Values: t (enabled), nil (disabled)
(setq airline-helm-colors t)

;; Set the cursor color based on the current evil state.
;; Valid Values: t (enabled), nil (disabled)
(setq airline-cursor-colors t)

;; Display the currend directory along with the filename.
;; Valid Values: 'airline-directory-full
;;               'airline-directory-shortened
;;               nil (disabled)
(setq airline-display-directory nil)

;; Max directory length to display when using 'airline-directory-shortened
(setq airline-shortened-directory-length 30)

;; Unicode character choices
(setq airline-utf-glyph-separator-left #xe0b0
      airline-utf-glyph-separator-right #xe0b2
      airline-utf-glyph-subseparator-left #xe0b1
      airline-utf-glyph-subseparator-right #xe0b3
      airline-utf-glyph-branch #xe0a0
      airline-utf-glyph-readonly #xe0a2
      airline-utf-glyph-linenumber #x2630)

;; You may also wish to force powerline to use utf8 character separators
(setq powerline-default-separator 'utf-8)
(setq powerline-utf-8-separator-left  #xe0b0
      powerline-utf-8-separator-right #xe0b2)

;; lisp
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Chinese input
(require 'pyim)
(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(setq default-input-method "pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(global-evil-leader-mode)
;(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)
;; Enable Evil
(require 'evil)
(evil-mode 1)

;; 不要自动创建备份文件
(setq make-backup-files nil)

;; auto revert
(global-auto-revert-mode 1)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
(require 'org-attach-git)
;; attach files in Dired buffers
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map
              (kbd "C-c C-x a")
              #'org-attach-dired-to-subtree)))
;; bind the previous command with a specific attachment method
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-c C-x c")
              (lambda ()
                (interactive)
                (let ((org-attach-method 'cp))
                  (call-interactively #'org-attach-dired-to-subtree))))))

;; 当 TODO 完成时自动记录时间戳
(setq org-log-done 'time)
(setq org-export-with-smart-quotes t)
(setq org-hide-emphasis-markers t)
(add-hook 'org-mode-hook 'visual-line-mode)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;(add-hook 'org-mode-hook 'variable-pitch-mode)

(let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))


(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

;; table align with Chinese
(add-hook 'org-mode-hook #'valign-mode)
;; setup font size for English and Chinese
;(eval-when-compile (require 'cl))
;(defun set-font (english chinese english-size chinese-size)
;  (set-face-attribute 'default nil :font
;                      (format "%s:pixelsize=%d" english english-size))
;  (dolist (charset '(kana han symbol cjk-misc bopomofo))
;    (set-fontset-font (frame-parameter nil 'font) charset
;                      (font-spec :family chinese :size chinese-size))))
;(ecase system-type
;  (gnu/linux
;    (set-face-bold-p 'bold nil)
;    (set-face-underline-p 'bold nil)
;    (set-font "DejaVu Sans Mono" "等距更纱黑体 SC" 15 15))
;  (darwin
;    (set-font "DejaVu Sans Mono" "等距更纱黑体 SC" 16 16)))

(setq org-html-head "<meta http-equiv='X-UA-Compatible' content='IE=edge'><meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'><style>html{touch-action:manipulation;-webkit-text-size-adjust:100%}body{padding:0;margin:0;background:#f2f6fa;color:#3c495a;font-weight:normal;font-size:15px;font-family:'San Francisco','Roboto','Arial',sans-serif}h2,h3,h4,h5,h6{font-family:'Trebuchet MS',Verdana,sans-serif;color:#586b82;padding:0;margin:20px 0 10px 0;font-size:1.1em}h2{margin:30px 0 10px 0;font-size:1.2em}a{color:#3fa7ba;text-decoration:none}p{margin:6px 0;text-align:justify}ul,ol{margin:0;text-align:justify}ul>li>code{color:#586b82}pre{white-space:pre-wrap}#content{width:96%;max-width:1000px;margin:2% auto 6% auto;background:white;border-radius:2px;border-right:1px solid #e2e9f0;border-bottom:2px solid #e2e9f0;padding:0 115px 150px 115px;box-sizing:border-box}#postamble{display:none}h1.title{background-color:#343C44;color:#fff;margin:0 -115px;padding:60px 0;font-weight:normal;font-size:2em;border-top-left-radius:2px;border-top-right-radius:2px}@media (max-width: 1050px){#content{padding:0 70px 100px 70px}h1.title{margin:0 -70px}}@media (max-width: 800px){#content{width:100%;margin-top:0;margin-bottom:0;padding:0 4% 60px 4%}h1.title{margin:0 -5%;padding:40px 5%}}pre,.verse{box-shadow:none;background-color:#f9fbfd;border:1px solid #e2e9f0;color:#586b82;padding:10px;font-family:monospace;overflow:auto;margin:6px 0}#table-of-contents{margin-bottom:50px;margin-top:50px}#table-of-contents h2{margin-bottom:5px}#text-table-of-contents ul{padding-left:15px}#text-table-of-contents>ul{padding-left:0}#text-table-of-contents li{list-style-type:none}#text-table-of-contents a{color:#7c8ca1;font-size:0.95em;text-decoration:none}table{border-color:#586b82;font-size:0.95em}table thead{color:#586b82}table tbody tr:nth-child(even){background:#f9f9f9}table tbody tr:hover{background:#586b82!important;color:white}table .left{text-align:left}table .right{text-align:right}.todo{font-family:inherit;color:inherit}.done{color:inherit}.tag{background:initial}.tag>span{background-color:#eee;font-family:monospace;padding-left:7px;padding-right:7px;border-radius:2px;float:right;margin-left:5px}#text-table-of-contents .tag>span{float:none;margin-left:0}.timestamp{color:#7c8ca1}@media print{@page{margin-bottom:3cm;margin-top:3cm;margin-left:2cm;margin-right:2cm;font-size:10px}#content{border:none}}</style>")

;;
;; latex settings
;;

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("org-article"
               "\\documentclass[a4paper]{article}
                \\setcounter{secnumdepth}{4}
                \\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue,backref=page]{hyperref}
                \\usepackage{graphicx}
                \\usepackage{grffile}
                \\usepackage{longtable}
                \\usepackage{wrapfig}
                \\usepackage{rotating}
                \\usepackage[normalem]{ulem}
                \\usepackage{amsmath}
                \\usepackage{textcomp}
                \\usepackage{amssymb}
                \\usepackage{capt-of}
                \\usepackage{xeCJK}
                \\usepackage{fontspec}
                \\setCJKmainfont{AR PL KaitiM GB}
                \\setCJKmonofont{AR PL KaitiM GB}
                \\setCJKfamilyfont{kaiti}{KaiTi}
                \\newcommand{\\KaiTi}{\\CJKfamily{kaiti}}
                \\usepackage[T1]{fontenc}
                \\usepackage[scaled]{beraserif}
                \\usepackage[scaled]{berasans}
                \\usepackage[scaled]{beramono}
                \\newcommand{\\chuhao}{\\fontsize{42.2pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaochu}{\\fontsize{36.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\yihao}{\\fontsize{26.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaoyi}{\\fontsize{24.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\erhao}{\\fontsize{22.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaoer}{\\fontsize{18.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\sanhao}{\\fontsize{16.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaosan}{\\fontsize{15.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\sihao}{\\fontsize{14.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaosi}{\\fontsize{12.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\wuhao}{\\fontsize{10.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaowu}{\\fontsize{9.0pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\liuhao}{\\fontsize{7.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaoliu}{\\fontsize{6.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\qihao}{\\fontsize{5.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\bahao}{\\fontsize{5.0pt}{\\baselineskip}\\selectfont}
                \\usepackage{color}
                \\usepackage{geometry}
                \\geometry{top=2cm,bottom=2cm,right=2cm,left=2cm}
                \\geometry{headsep=0.5cm}
                \\geometry{footskip=0.5cm}
                \\usepackage{setspace}
                \\setlength{\\baselineskip}{22pt}
                \\setlength{\\parskip}{0pt}
                \\setlength{\\parindent}{0pt} % no indent of new lines or paragraph
                \\onehalfspacing
                \\usepackage{enumerate}
                \\usepackage{enumitem}
                \\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\\parskip,topsep=5pt}
                \\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\\parskip,topsep=5pt}
                \\setdescription{itemsep=0pt,partopsep=0pt,parsep=\\parskip,topsep=5pt}
                \\usepackage{authoraftertitle}
                \\usepackage{fancyhdr}
                \\definecolor{hfcolor}{rgb}{0.6941,0.6745,0.4863}
                \\pagestyle{fancy}
                  \\fancyhf{}
                  \\fancyhead[C]{\\KaiTi \\color{hfcolor} \\xiaowu \\MyTitle}
                  \\fancyfoot[C]{\\KaiTi \\color{hfcolor} \\xiaowu \\thepage}
                \\fancypagestyle{plain}{
                  \\fancyhf{}
                  \\fancyfoot[C]{}
                  \\renewcommand{\\headrulewidth}{0pt}
                  \\renewcommand{\\footrulewidth}{0pt}}
                \\usepackage{caption}
                \\captionsetup{font={small}}
                \\usepackage{minted}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]
                [EXTRA]"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("org-article-ctex"
               "\\documentclass[a4paper,UTF8]{ctexart}
                \\setcounter{secnumdepth}{4}
                \\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue,backref=page]{hyperref}
                \\usepackage{graphicx}
                \\usepackage{grffile}
                \\usepackage{longtable}
                \\usepackage{wrapfig}
                \\usepackage{rotating}
                \\usepackage[normalem]{ulem}
                \\usepackage{amsmath}
                \\usepackage{textcomp}
                \\usepackage{amssymb}
                \\usepackage{capt-of}
                \\usepackage{xeCJK}
                \\usepackage{fontspec}
                \\setCJKmainfont{AR PL KaitiM GB}
                \\setCJKmonofont{AR PL KaitiM GB}
                \\setCJKfamilyfont{kaiti}{KaiTi}
                \\newcommand{\\KaiTi}{\\CJKfamily{kaiti}}
                \\usepackage[T1]{fontenc}
                \\usepackage[scaled]{beraserif}
                \\usepackage[scaled]{berasans}
                \\usepackage[scaled]{beramono}
                \\newcommand{\\chuhao}{\\fontsize{42.2pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaochu}{\\fontsize{36.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\yihao}{\\fontsize{26.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaoyi}{\\fontsize{24.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\erhao}{\\fontsize{22.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaoer}{\\fontsize{18.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\sanhao}{\\fontsize{16.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaosan}{\\fontsize{15.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\sihao}{\\fontsize{14.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaosi}{\\fontsize{12.1pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\wuhao}{\\fontsize{10.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaowu}{\\fontsize{9.0pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\liuhao}{\\fontsize{7.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\xiaoliu}{\\fontsize{6.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\qihao}{\\fontsize{5.5pt}{\\baselineskip}\\selectfont}
                \\newcommand{\\bahao}{\\fontsize{5.0pt}{\\baselineskip}\\selectfont}
                \\usepackage{color}
                \\usepackage{geometry}
                \\geometry{top=2cm,bottom=2cm,right=2cm,left=2cm}
                \\geometry{headsep=0.5cm}
                \\geometry{footskip=0.5cm}
                \\usepackage{setspace}
                \\setlength{\\baselineskip}{22pt}
                \\setlength{\\parskip}{2pt}
                \\setlength{\\parindent}{15pt} % indent of new lines or paragraph
                \\onehalfspacing
                \\usepackage{enumerate}
                \\usepackage{enumitem}
                \\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\\parskip,topsep=5pt}
                \\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\\parskip,topsep=5pt}
                \\setdescription{itemsep=0pt,partopsep=0pt,parsep=\\parskip,topsep=5pt}
                \\usepackage{authoraftertitle}
                \\usepackage{fancyhdr}
                \\definecolor{hfcolor}{rgb}{0.6941,0.6745,0.4863}
                \\pagestyle{fancy}
                  \\fancyhf{}
                  \\fancyhead[C]{\\KaiTi \\color{hfcolor} \\xiaowu \\MyTitle}
                  \\fancyfoot[C]{\\KaiTi \\color{hfcolor} \\xiaowu \\thepage}
                \\fancypagestyle{plain}{
                  \\fancyhf{}
                  \\fancyfoot[C]{}
                  \\renewcommand{\\headrulewidth}{0pt}
                  \\renewcommand{\\footrulewidth}{0pt}}
                \\usepackage{caption}
                \\captionsetup{font={small}}
                \\usepackage{minted}
                [NO-DEFAULT-PACKAGES]
                [NO-PACKAGES]
                [EXTRA]"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;(setq org-latex-listings t)
;(add-to-list 'org-latex-packages-alist '("" "listings"))
;(add-to-list 'org-latex-packages-alist '("" "color"))
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted")))
(setq org-latex-minted-options '(("breaklines" "true")
                                 ("breakanywhere" "true")))
;(setq org-latex-pdf-process
;      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Chinese output need to use xelatex
(setq org-latex-pdf-process
      '("xelatex -8bit -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -8bit -shell-escape -interaction nonstopmode -output-directory %o %f"))

;(add-to-list 'org-latex-packages-alist '("top=2.5cm, bottom=2.5cm, left=1.5cm, right=1.5cm" "geometry" nil))

;; Force page break after TOC
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(setq org-latex-prefer-user-labels t)

;; ditaa and languages setup
(setq org-ditaa-jar-path "/usr/bin/ditaa")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (emacs-lisp . t)
   (shell . t)
   (R . t)
   (octave . t)
   (dot . t)
   (latex . t)))

;;execute code blocks without prompting:
(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("ditaa" "emacs-lisp" "sh" "R" "octave" "dot" "latex"))))
(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)

(setq ditaa-cmd "java -jar /usr/bin/ditaa")
(defun djcb-ditaa-generate ()
  (interactive)
  (shell-command
    (concat ditaa-cmd " " buffer-file-name)))

;; latex preview setup
(add-to-list 'org-latex-packages-alist
             '("" "tikz" t))
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))

(setq org-latex-create-formula-image-program 'imagemagick)
;(setq org-latex-create-formula-image-program 'dvipng)

;; setup a clean title page for beamer
(defun my-beamer-maketitle-filter (output backend info)
  (if (string= backend "beamer")
      (replace-regexp-in-string "\\\\maketitle"
                                "\\\\begin{frame}[plain]\n\\\\maketitle\n\\\\end{frame}"
                                output)
    output))

(add-to-list 'org-export-filter-final-output-functions
               'my-beamer-maketitle-filter)
