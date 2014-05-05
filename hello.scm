(use awful)

(enable-sxml #t)

; Automatic Reload
(add-request-handler-hook!
   'reload-on-request
    (lambda (path handler)
         (reload-apps (awful-apps))
            (handler)))

(define-page (main-page-path)
  (lambda ()
    (set-page-title! "Contact")
    `((a (@ (href "http://dohmen.io")) "Hello " , ($ 'name "world") "!")
      (form
          (input (@ (type "text") (name "name") (placeholder "Your Name")))
          (input (@ (type "email") (name "email") (placeholder "Your Mail Address")))
          (textarea (@ (name "request") (placeholder "Your Request")))
          (input (@ (type "submit") (value "Send Request")))
        )))
  doctype: "<!DOCTYPE html>"
  method: '(GET POST)
  )
