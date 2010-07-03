;; gb4e.el --- Style hook for the gb4e package

;; Copyright (C) 2004 Sebastian Nagel
;; License: GPL, see the file COPYING in the base directory of AUC TeX

;; AUTHOR: Sebastian Nagel <wastl((at))cis.uni-muenchen.de>
;; CREATED: 2004/07/02

;; Commentary:

;; This file is intended to be used with the AUC TeX-Package by Per
;; Abrahamsen. Put this File into your TeX-style-path, e.g. 
;;  (setq TeX-style-private  '("~/texmf/tex/latex/auctex/style/"))
;; in your .emacs file. You may also byte-compile this file.

;;; Code:
(TeX-add-style-hook
 "gb4e"
 (function
  (lambda ()
    (LaTeX-add-environments
     '("xlisti" LaTeX-env-gb4e-exe)
     '("xlistI" LaTeX-env-gb4e-exe)
     '("xlistA" LaTeX-env-gb4e-exe)
     '("xlistn" LaTeX-env-gb4e-exe)
     '("xlista" LaTeX-env-gb4e-exe)
     '("xlist"  LaTeX-env-gb4e-exe)
     '("exe"    LaTeX-env-gb4e-exe))
    (TeX-add-symbols
     '("ex"  LaTeX-item-gb4e-ex)
     '("exi" "Label" LaTeX-item-gb4e-ex)
     '("exp" "Label" LaTeX-item-gb4e-ex)
     '("exr" "Label" LaTeX-item-gb4e-ex)
     '("sn"  LaTeX-item-gb4e-ex)
     "al"
     "arrowalign"
     "atcenter"
     "attop"
     "bb"
     "be"
     "boven"
     "bovenop"
     "bu"
     "centr"
     "ct"
     "de"
     "ea"
     "elevenex"
     "exewidth"
     "fillleft"
     "fillright"
     "ga"
     "ibar"
     "iibar"
     "judgewidth"
     "lb"
     "lcomment"
     "leaderfill"
     "lf"
     "link"
     "mbar"
     "obar"
     "pd"
     "pijl"
     "pointerdown"
     "pointerup"
     "primebars"
     "prmbrs"
     "pu"
     "rb"
     "spacer"
     "spec"
     "th"
     "tx"
     "z"
     "vl")
    (setq LaTeX-item-list
          (append '(("exe"   . LaTeX-item-gb4e-exe)
		    ("xlist" . LaTeX-item-gb4e-exe))
		  LaTeX-item-list)))))

(defun LaTeX-env-gb4e-exe (environment)
  "Insert environment for numbered linguistic examples."
  (let ((width (read-string "Template for labelwidth [optional]: ")))
    (LaTeX-insert-environment environment
			      (unless (string= width "")
				(concat "[" width "]"))))
  (end-of-line 0)
  (delete-char 1)
  (delete-horizontal-space)
  (LaTeX-insert-item))

(defun LaTeX-item-gb4e-exe ()
  (TeX-insert-macro "ex"))

(defun LaTeX-item-gb4e-ex (optional)
  "Insert a linguistic example."
  (let ((judgement (read-string "Judgement [optional]: ")))
    (if (string= judgement "")
        (insert " ")
      (insert (concat "[" judgement "]" "{}"))
      (backward-char 1)))
  (indent-according-to-mode))

