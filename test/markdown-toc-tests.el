(require 'ert)
(require 'ert-expectations)
(require 'el-mock)

(expectations
 (expect "   "       (markdown-toc/--symbol " " 3))
 (expect "-#--#--#-" (markdown-toc/--symbol "-#-" 3)))

(expectations
 (expect "[some markdown page title](#some-markdown-page-title)"
         (markdown-toc/--to-link "some markdown page title")))

(expectations
 (expect "- [some markdown page title](#some-markdown-page-title)
- [main title](#main-title)
        - [Sources](#sources)
                - [Marmalade (recommended)](#marmalade-(recommended))
                - [Melpa-stable](#melpa-stable)
                - [Melpa (~snapshot)](#melpa-(~snapshot))
        - [Install](#install)
                - [Load org-trello](#load-org-trello)
                - [Alternative](#alternative)
                        - [Git](#git)
                        - [Tar](#tar)
- [another title](#another-title)
        - [with](#with)
        - [some](#some)
        - [heading](#heading)")
 (markdown-toc/--to-markdown-toc '((0 . "some markdown page title")
                                   (0 . "main title")
                                   (1 . "Sources")
                                   (2 . "Marmalade (recommended)")
                                   (2 . "Melpa-stable")
                                   (2 . "Melpa (~snapshot)")
                                   (1 . "Install")
                                   (2 . "Load org-trello")
                                   (2 . "Alternative")
                                   (3 . "Git")
                                   (3 . "Tar")
                                   (0 . "another title")
                                   (1 . "with")
                                   (1 . "some")
                                   (1 . "heading"))))
