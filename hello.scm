; http://wiki.call-cc.org/eggref/4/awful
(use awful)

; http://wiki.call-cc.org/eggref/4/sxml-informal
(use sxml-transforms sxml-informal)

; http://wiki.call-cc.org/eggref/4/scss
; http://wiki.call-cc.org/eggref/4/jsmin
; http://wiki.call-cc.org/eggref/4/lowdown

(enable-sxml #t)

; Automatic Reload
(add-request-handler-hook!
   'reload-on-request
    (lambda (path handler)
         (reload-apps (awful-apps))
            (handler)))

(define send-page "/send")

(define-page (main-page-path)
  (lambda ()
    (set-page-title! "Contact")
    `((h1 "Contact")
      (form (@ (method "POST") (action ,send-page))
          (input (@ (type "text") (name "name") (placeholder "Your Name")))
          (input (@ (type "email") (name "email") (placeholder "Your Mail Address")))
          (textarea (@ (name "request") (placeholder "Your Request")))
          (input (@ (type "submit") (value "Send Request")))
        )
      ))
  doctype: "<!DOCTYPE html>"
  method: '(GET))

(define-page send-page
  (lambda ()
    (set-page-title! "Thank you!")
    `((h1 "Thanks, " , ($ 'name "world") "!")))
  method: '(POST))
