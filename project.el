;;; Code:

(require 'org-publish)
(setq org-publish-project-alist
      '(

	;; ... add all the components here (see below)...
	("org-notes"
	 :base-directory "~/Fakespace/fn-dev/org/"
	 :base-extension "org"
	 :publishing-directory "~/Fakespace/fn-dev/jekyll/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :html-extension "html"
	 :headline-levels 4
	 :body-only t
	 )

	("org-static"
	 :base-directory "~/Fakespace/fn-dev/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Fakespace/fn-dev/jekyll/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("org"
	 :components ("org-notes" "org-static")
	 )


	))
