#!/usr/bin/sbcl --script

(defun do-plot ( name )
  (sb-ext:run-program "/usr/bin/gnuplot"
		      (list (concatenate 'string
					 "/var/measurement/" name ".script"))))

(defun get-CO2-or-eTVOC (string0 string1)
  (parse-integer
   (concatenate 'string (subseq string0 2) (subseq string1 2)) :radix 16))

(defun make-site-contents ()
  (let ((current-values-CO2 ()) (current-values-eTVOC ())
	current-line last-CO2 last-eTVOC)
    (dotimes (i 100)
      (ignore-errors
	(with-open-file (file-input
			 (concatenate 'string "/var/measurement/CO2-sicher"
				      (format nil "~a" (- 99 i))))
	  (setf current-line (read-line file-input))
	  (setf current-values-CO2 (append current-values-CO2
				(list (get-CO2-or-eTVOC
				 (subseq current-line 0 4)
				 (subseq current-line 5 9)))))
	  (setf current-values-eTVOC (append current-values-eTVOC
				(list (get-CO2-or-eTVOC
				 (subseq current-line 10 14)
				 (subseq current-line 15 19))))))))
    (with-open-file (input-stream "/var/measurement/CO2-data")
      (setf current-line (read-line input-stream))
      (setf current-values-CO2 (append current-values-CO2
				(list (get-CO2-or-eTVOC
				 (subseq current-line 0 4)
				 (subseq current-line 5 9)))))
	  (setf current-values-eTVOC (append current-values-eTVOC
				(list (get-CO2-or-eTVOC
				 (subseq current-line 10 14)
				 (subseq current-line 15 19))))))
    (setf last-CO2 (first (last current-values-CO2)))
    (setf last-eTVOC (first (last current-values-eTVOC)))
    (with-open-file
	(CO2-output "/var/measurement/CO2.dat"
		    :direction :output :if-exists :supersede)
      (with-open-file (eTVOC-output "/var/measurement/eVOC.dat"
				    :direction :output :if-exists :supersede)
	(dotimes (i (length current-values-CO2))
	  (format CO2-output "~a ~a~%" i (nth i current-values-CO2))
	  (format eTVOC-output "~a ~a~%" i (nth i current-values-eTVOC)))))
    (with-open-file (site-output "/var/www/html/index.html"
				 :direction :output :if-exists :supersede)
      (format site-output "~a" "<HTML><HEAD><Title>Luftmesswerte</Title>")
      (format site-output "~a" "<META http-equiv=\"refresh\" content=\"60\">")
      (format site-output "~a" "</HEAD><BODY><H1>CO2 Messwerte</H1><BR>")
      (format site-output "~a~a~a" "Aktueller CO2 Messwert: " last-CO2 "ppm." )
      (format site-output "~a~a~a" "<br>L&uuml;ften ist "
	      (if (> last-CO2 1000) "n&ouml;tig"
		  (if (> last-CO2 700) "ratsam" "nicht n&ouml;tig"))
	      ".<BR><BR>")
      (format site-output "~a" "die letzten CO2 Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"CO2.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "<BR><BR><BR><BR>")
      (format site-output "~a"
	      "<H1>Menge an fl&uuml;chtigen organischen Stoffen:</H1>")
      (format site-output "~a~a~a" "Aktueller Messwert: " last-eTVOC " ppb.")
      (format site-output "~a" "<BR><BR>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"eVOC.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "<BR><BR><BR><BR>")
      (format site-output "~a" "</BODY></HTML>")))
    (do-plot "CO2")
    (do-plot "eVOC"))

(make-site-contents)
