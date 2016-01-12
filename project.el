;; some project dependencies
(require 'ox-html)
(require 'ox-publish)

;; org-publish configuration
(setq org-html-doctype "html5")
(setq org-html-special-string-regexps nil)

;; actual project confugration
(setq org-publish-project-alist
      '(
	("fm-notes"
	 :base-directory "~/Fakespace/francismurillo.github.io/org"
	 :base-extension "org"
	 :publishing-directory "~/Fakespace/francismurillo.github.io"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :html-extension "html"
	 :headline-levels 4
	 :body-only t
	 :with-toc nil
	 )

	("fm-static"
	 :base-directory "~/Fakespace/francismurillo.github.io/org"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Fakespace/francismurillo.github.io"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("fm"
	 :components ("fm-notes" "fm-static")
	 )
	))
