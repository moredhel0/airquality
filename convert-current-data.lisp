#!/usr/bin/sbcl --script

(load "/var/measurement/convert.lisp")

(with-open-file (output-stream "/var/measurement/converted-values"
			       :direction :output
			       :if-exists :supersede
			       :if-does-not-exist :create)
  (print (get-current-values) output-stream))
