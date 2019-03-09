(defconst fbb/project-dir (projectile-project-root))

(when (require 'prodigy)
  (prodigy-define-tag
    :name 'jekyll
    :command "jekyll"
    :stop-signal 'kill)

  (fn/prodigy-define-service
   :name "fnlog-server"
   :tags `(fnlog jekyll)
   :port 34000
   :args `("serve" "--host=0.0.0.0" "--port=34000")
   :cwd fbb/project-dir

   :bind-command-name "fnlog"
   :bind-map fn/prodigy-map
   :bind (kbd "f f"))

  (prodigy-start-service (prodigy-find-service "fnlog-server")))
