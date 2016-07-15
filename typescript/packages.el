;;; packages.el --- typescript layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Slava Kim <imslavko@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defconst typescript-packages
  '(tide typescript-mode))

(defun typescript/init-tide ()
  "Initialize my package"
  (use-package tide
    :defer t
    :mode ("\\.ts\\'" . typescript-mode)
    :init
    (progn
      (defun setup-tide-mode ()
        (interactive)
        (tide-setup)
        (flycheck-mode +1)
        (setq flycheck-check-syntax-automatically '(save mode-enabled))
        (eldoc-mode +1)
        (company-mode +1))
      (add-hook 'typescript-mode-hook #'setup-tide-mode)
      (setq company-tooltip-align-annotations t)
      (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
        "gg" 'tide-jump-to-definition
        "gd" 'tide-jump-to-definition
        "d"  'tide-jump-to-definition
        "gr" 'tide-references
        "gn" 'tide-find-next-reference
        "gp" 'tide-find-previous-reference
        "r"  'tide-rename-symbol
        "f"  'tide-format
        )
      )
    :config
    ))
