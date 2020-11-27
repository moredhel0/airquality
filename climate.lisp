#!/usr/bin/sbcl --script

(defun do-plot ( name )
  (sb-ext:run-program "/usr/bin/gnuplot"
		      (list (concatenate 'string
					 "/var/measurement/" name ".script"))))

(defun make-site-contents ()
  (let ((stored-values ()) (last-values ()))
    (with-open-file (data-input "/var/measurement/converted-values")
      (setf last-values (read data-input)))
    (ignore-errors
      (with-open-file (data-input "/var/measurement/stored-values")
	(setf stored-values (read data-input))))
    (setf stored-values (append stored-values (list last-values)))
    (let ((current 0))
      (with-open-file 
	(CO2-output "/var/measurement/CO2.dat"
		    :direction :output :if-exists :supersede
				     :if-does-not-exist :create)
      (with-open-file (eTVOC-output "/var/measurement/eVOC.dat"				    :direction :output :if-exists :supersede
				    :if-does-not-exist :create)
	(with-open-file (hum-output "/var/measurement/hum.dat"
				    :direction :output
				    :if-exists :supersede
				    :if-does-not-exist :create)
	  (with-open-file (press-output "/var/measurement/press.dat"
					:direction :output
					:if-exists :supersede
					:if-does-not-exist :create)
	    (with-open-file (temp-output "/var/measurement/temp.dat"
					 :direction :output
					 :if-exists :supersede
					 :if-does-not-exist :create)
	      (dolist (element stored-values)
		(format CO2-output "~a ~a~%" current (getf element :co2))
		(format eTVOC-output "~a ~a~%" current (getf element :etvoc))
		(format press-output "~a ~,1f~%" current (getf element :press))
		(format hum-output "~a ~,1f~%" current (getf element :hum))
		(format temp-output "~a ~,2f~%" current (getf element :temp))
		(setf current (+ 1 current)))))))))
    (with-open-file (site-output "/var/www/html/index.html"
				 :direction :output :if-exists :supersede
				     :if-does-not-exist :create)
      (format site-output "~a" "<HTML><HEAD><Title>Luftmesswerte</Title>")
      (format site-output "~a" "<META http-equiv=\"refresh\" content=\"60\">")
      (format site-output "~a"
	      "</HEAD><BODY><TABLE><TR><TD><H2>CO<sub>2</sub> Messwerte:</H2>")
      (format site-output "~a~a~a" "Aktueller CO<sub>2</sub> Messwert: "
	      (getf last-values :CO2) " ppm." )
      (format site-output "~a~a~a" "<br>L&uuml;ften ist "
	      (if (> (getf last-values :CO2) 1000) "n&ouml;tig"
		  (if (> (getf last-values :CO2) 700) "ratsam"
		      "nicht n&ouml;tig"))
	      ".</TD><TD>")
      (format site-output "~a" "die letzten CO<sub>2</sub> Messwerte:<BR>")
      (format site-output "~a"
	      "<IMG src=\"CO2.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR><TR><TD>")
      (format site-output "~a"
	      "<H2>Menge an fl&uuml;chtigen organischen Stoffen:</H2>")
      (format site-output "~a~a~a" "Aktueller Messwert: "
	      (getf last-values :etvoc) " ppb.")
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"eVOC.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "<TR><TD>")
      (format site-output "~a" "<H2>Luftfeuchtigkeit:</H2>")
      (format site-output "aktueller Messwert: ~,1f%."
	      (getf last-values :hum))
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"hum.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "<TR><TD>")
      (format site-output "~a" "<H2>Temperatur:</H2>")
      (format site-output "aktueller Messwert: ~,2f &deg;C."
	      (getf last-values :temp))
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"temp.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "<TR><TD>")
      (format site-output "~a" "<H2>Luftdruck:</H2>")
      (format site-output "aktueller Messwert: ~,1f hPa."
	      (getf last-values :press))
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"press.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "</TABLE></BODY></HTML>")))
    (do-plot "CO2")
    (do-plot "eVOC")
    (do-plot "temp")
    (do-plot "hum")
    (do-plot "press"))

(make-site-contents)
