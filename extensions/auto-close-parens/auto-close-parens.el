;; -*- coding:euc-jp-unix; -*-
;; close-open-paren.el : insert appropriate closing parenthesis.
;; Ref.: http://www.emacswiki.org/emacs/UniversialCloseParen
;;       http://emacswiki.org/emacs/EmacsSyntaxTable
;;       skk/skk-tankan.el

(defconst close-open-paren-syntax-table
    (let ((table (make-syntax-table)))
      (modify-syntax-entry ?{ "(}" table)
      (modify-syntax-entry ?} "){" table)
      (modify-syntax-entry ?\( "()" table)
      (modify-syntax-entry ?\) ")(" table)
      (modify-syntax-entry ?\[ "(]" table)
      (modify-syntax-entry ?\] ")[" table)
      (modify-syntax-entry ?< "(>" table)
      (modify-syntax-entry ?> ")<" table)
      (modify-syntax-entry ?�� "(��" table) ; �Ϥᾮ���,�Ϥ�ݳ��, LEFT PARENTHESIS
      (modify-syntax-entry ?�� ")��" table) ; ����꾮���,�����ݳ��, RIGHT PARENTHESIS
      (modify-syntax-entry ?�� "(��" table) ; �Ϥ᤭�ä���(����)���, LEFT TORTOISE SHELL BRACKET
      (modify-syntax-entry ?�� ")��" table) ; ����꤭�ä���(����)���, RIGHT TORTOISE SHELL BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥ�����,�Ϥ�ѳ��, LEFT SQUARE BRACKET
      (modify-syntax-entry ?�� ")��" table) ; ���������,�����ѳ��, RIGHT SQUARE BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥ�����,�Ϥ��ȳ��, LEFT CURLY BRACKET
      (modify-syntax-entry ?�� ")��" table) ; ���������,������ȳ��, RIGHT CURLY BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥỳ���, LEFT ANGLE BRACKET
      (modify-syntax-entry ?�� ")��" table) ; ����껳���, RIGHT ANGLE BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥ���Ż����, LEFT DOUBLE ANGLE BRACKET
      (modify-syntax-entry ?�� ")��" table) ; �������Ż����, RIGHT DOUBLE ANGLE BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥᤫ�����, LEFT CORNER BRACKET
      (modify-syntax-entry ?�� ")��" table) ; ����꤫�����, RIGHT CORNER BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥ���Ť������, LEFT WHITE CORNER BRACKET
      (modify-syntax-entry ?�� ")��" table) ; �������Ť������, RIGHT WHITE CORNER BRACKET
      (modify-syntax-entry ?�� "(��" table) ; �Ϥ᤹���դ����, LEFT BLACK LENTICULAR BRACKET
      (modify-syntax-entry ?�� ")��" table) ; ����ꤹ���դ����, RIGHT BLACK LENTICULAR BRACKET
      (modify-syntax-entry ?\\ "'" table)
      table)
    "A syntax table for pairs of parentheses.")

(defun close-open-paren ()
  (interactive)
  (let (pos closing)
  (with-syntax-table close-open-paren-syntax-table    ; �����ˤϾ������ʸˡ�ơ��֥������
	  (setq pos (save-excursion (up-list -1) (point)))  ; ������̤ΰ��֤�pos������
	  (setq closing (matching-paren (char-after pos)))) ; pos�ΰ��֤ˤ��볫������б������Ĥ���̤�closing��
	(insert closing)))                                  ; �Ĥ���̤򸽺ߤΰ��֤�����

(provide 'auto-close-parens)
