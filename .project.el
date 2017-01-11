(progn
  (require 'magin)

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
