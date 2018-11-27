(when (require 'magin)
  (magin--dsl-defblock
   `(defblock org-jekyll-blogger-site
      (comment "Block for org-jekyll-blogger-site")
      (dir ".sass-cache")

      (dir "_drafts")
      (dir "_site"))
   (list))

  (magin-write-to-project
   `(delimited
     (block org-jekyll-blogger-site))
   (projectile-project-root)))

(when (require 'prodigy)
  (prodigy-define-tag
    :name 'jekyll
    :command "jekyll"
    :args `("serve" "--host=0.0.0.0" "--port=34000")
    :stop-signal 'kill)

  (fn/prodigy-define-service
   :name "fnlog-server"
   :tags `(fnlog jekyll)
   :port 34000
    :args `("serve" "--host=0.0.0.0" "--port=34000")

   :bind-command-name "fnlog"
   :bind-map fn/prodigy-map
   :bind (kbd "f f"))

  (prodigy-start-service (prodigy-find-service "fnlog-server")))
