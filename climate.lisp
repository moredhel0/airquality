#!/usr/bin/sbcl --script

(defun do-plot ( name )
  (sb-ext:run-program "/usr/bin/gnuplot"
		      (list (concatenate 'string
					 "/var/measurement/" name ".script"))))

(defun get-CO2-or-eTVOC (string0 string1)
  (parse-integer
   (concatenate 'string (subseq string0 2) (subseq string1 2)) :radix 16))

(defun make-plist (data-string line-prefix counter)
  (cond
    ((string-equal "0" line-prefix)
     (cond
       ((= 0 counter) (list :00 data-string))
       ((= 1 counter) (list :01 data-string))
       ((= 2 counter) (list :02 data-string))
       ((= 3 counter) (list :03 data-string))
       ((= 4 counter) (list :04 data-string))
       ((= 5 counter) (list :05 data-string))
       ((= 6 counter) (list :06 data-string))
       ((= 7 counter) (list :07 data-string))
       ((= 8 counter) (list :08 data-string))
       ((= 9 counter) (list :09 data-string))
       ((= 10 counter) (list :0a data-string))
       ((= 11 counter) (list :0b data-string))
       ((= 12 counter) (list :0c data-string))
       ((= 13 counter) (list :0d data-string))
       ((= 14 counter) (list :0e data-string))
       ((= 15 counter) (list :0f data-string))))
    ((string-equal "1" line-prefix)
     (cond
       ((= 0 counter) (list :10 data-string))
       ((= 1 counter) (list :11 data-string))
       ((= 2 counter) (list :12 data-string))
       ((= 3 counter) (list :13 data-string))
       ((= 4 counter) (list :14 data-string))
       ((= 5 counter) (list :15 data-string))
       ((= 6 counter) (list :16 data-string))
       ((= 7 counter) (list :17 data-string))
       ((= 8 counter) (list :18 data-string))
       ((= 9 counter) (list :19 data-string))
       ((= 10 counter) (list :1a data-string))
       ((= 11 counter) (list :1b data-string))
       ((= 12 counter) (list :1c data-string))
       ((= 13 counter) (list :1d data-string))
       ((= 14 counter) (list :1e data-string))
       ((= 15 counter) (list :1f data-string))))
    ((string-equal "2" line-prefix)
     (cond
       ((= 0 counter) (list :20 data-string))
       ((= 1 counter) (list :21 data-string))
       ((= 2 counter) (list :22 data-string))
       ((= 3 counter) (list :23 data-string))
       ((= 4 counter) (list :24 data-string))
       ((= 5 counter) (list :25 data-string))
       ((= 6 counter) (list :26 data-string))
       ((= 7 counter) (list :27 data-string))
       ((= 8 counter) (list :28 data-string))
       ((= 9 counter) (list :29 data-string))
       ((= 10 counter) (list :2a data-string))
       ((= 11 counter) (list :2b data-string))
       ((= 12 counter) (list :2c data-string))
       ((= 13 counter) (list :2d data-string))
       ((= 14 counter) (list :2e data-string))
       ((= 15 counter) (list :2f data-string))))
    ((string-equal "3" line-prefix)
     (cond
       ((= 0 counter) (list :30 data-string))
       ((= 1 counter) (list :31 data-string))
       ((= 2 counter) (list :32 data-string))
       ((= 3 counter) (list :33 data-string))
       ((= 4 counter) (list :34 data-string))
       ((= 5 counter) (list :35 data-string))
       ((= 6 counter) (list :36 data-string))
       ((= 7 counter) (list :37 data-string))
       ((= 8 counter) (list :38 data-string))
       ((= 9 counter) (list :39 data-string))
       ((= 10 counter) (list :3a data-string))
       ((= 11 counter) (list :3b data-string))
       ((= 12 counter) (list :3c data-string))
       ((= 13 counter) (list :3d data-string))
       ((= 14 counter) (list :3e data-string))
       ((= 15 counter) (list :3f data-string))))
    ((string-equal "4" line-prefix)
     (cond
       ((= 0 counter) (list :40 data-string))
       ((= 1 counter) (list :41 data-string))
       ((= 2 counter) (list :42 data-string))
       ((= 3 counter) (list :43 data-string))
       ((= 4 counter) (list :44 data-string))
       ((= 5 counter) (list :45 data-string))
       ((= 6 counter) (list :46 data-string))
       ((= 7 counter) (list :47 data-string))
       ((= 8 counter) (list :48 data-string))
       ((= 9 counter) (list :49 data-string))
       ((= 10 counter) (list :4a data-string))
       ((= 11 counter) (list :4b data-string))
       ((= 12 counter) (list :4c data-string))
       ((= 13 counter) (list :4d data-string))
       ((= 14 counter) (list :4e data-string))
       ((= 15 counter) (list :4f data-string))))
    ((string-equal "5" line-prefix)
     (cond
       ((= 0 counter) (list :50 data-string))
       ((= 1 counter) (list :51 data-string))
       ((= 2 counter) (list :52 data-string))
       ((= 3 counter) (list :53 data-string))
       ((= 4 counter) (list :54 data-string))
       ((= 5 counter) (list :55 data-string))
       ((= 6 counter) (list :56 data-string))
       ((= 7 counter) (list :57 data-string))
       ((= 8 counter) (list :58 data-string))
       ((= 9 counter) (list :59 data-string))
       ((= 10 counter) (list :5a data-string))
       ((= 11 counter) (list :5b data-string))
       ((= 12 counter) (list :5c data-string))
       ((= 13 counter) (list :5d data-string))
       ((= 14 counter) (list :5e data-string))
       ((= 15 counter) (list :5f data-string))))
    ((string-equal "6" line-prefix)
     (cond
       ((= 0 counter) (list :60 data-string))
       ((= 1 counter) (list :61 data-string))
       ((= 2 counter) (list :62 data-string))
       ((= 3 counter) (list :63 data-string))
       ((= 4 counter) (list :64 data-string))
       ((= 5 counter) (list :65 data-string))
       ((= 6 counter) (list :66 data-string))
       ((= 7 counter) (list :67 data-string))
       ((= 8 counter) (list :68 data-string))
       ((= 9 counter) (list :69 data-string))
       ((= 10 counter) (list :6a data-string))
       ((= 11 counter) (list :6b data-string))
       ((= 12 counter) (list :6c data-string))
       ((= 13 counter) (list :6d data-string))
       ((= 14 counter) (list :6e data-string))
       ((= 15 counter) (list :6f data-string))))
    ((string-equal "7" line-prefix)
     (cond
       ((= 0 counter) (list :70 data-string))
       ((= 1 counter) (list :71 data-string))
       ((= 2 counter) (list :72 data-string))
       ((= 3 counter) (list :73 data-string))
       ((= 4 counter) (list :74 data-string))
       ((= 5 counter) (list :75 data-string))
       ((= 6 counter) (list :76 data-string))
       ((= 7 counter) (list :77 data-string))
       ((= 8 counter) (list :78 data-string))
       ((= 9 counter) (list :79 data-string))
       ((= 10 counter) (list :7a data-string))
       ((= 11 counter) (list :7b data-string))
       ((= 12 counter) (list :7c data-string))
       ((= 13 counter) (list :7d data-string))
       ((= 14 counter) (list :7e data-string))
       ((= 15 counter) (list :7f data-string))))
    ((string-equal "8" line-prefix)
     (cond
       ((= 0 counter) (list :80 data-string))
       ((= 1 counter) (list :81 data-string))
       ((= 2 counter) (list :82 data-string))
       ((= 3 counter) (list :83 data-string))
       ((= 4 counter) (list :84 data-string))
       ((= 5 counter) (list :85 data-string))
       ((= 6 counter) (list :86 data-string))
       ((= 7 counter) (list :87 data-string))
       ((= 8 counter) (list :88 data-string))
       ((= 9 counter) (list :89 data-string))
       ((= 10 counter) (list :8a data-string))
       ((= 11 counter) (list :8b data-string))
       ((= 12 counter) (list :8c data-string))
       ((= 13 counter) (list :8d data-string))
       ((= 14 counter) (list :8e data-string))
       ((= 15 counter) (list :8f data-string))))
    ((string-equal "9" line-prefix)
     (cond
       ((= 0 counter) (list :90 data-string))
       ((= 1 counter) (list :91 data-string))
       ((= 2 counter) (list :92 data-string))
       ((= 3 counter) (list :93 data-string))
       ((= 4 counter) (list :94 data-string))
       ((= 5 counter) (list :95 data-string))
       ((= 6 counter) (list :96 data-string))
       ((= 7 counter) (list :97 data-string))
       ((= 8 counter) (list :98 data-string))
       ((= 9 counter) (list :99 data-string))
       ((= 10 counter) (list :9a data-string))
       ((= 11 counter) (list :9b data-string))
       ((= 12 counter) (list :9c data-string))
       ((= 13 counter) (list :9d data-string))
       ((= 14 counter) (list :9e data-string))
       ((= 15 counter) (list :9f data-string))))
    ((string-equal "a" line-prefix)
     (cond
       ((= 0 counter) (list :a0 data-string))
       ((= 1 counter) (list :a1 data-string))
       ((= 2 counter) (list :a2 data-string))
       ((= 3 counter) (list :a3 data-string))
       ((= 4 counter) (list :a4 data-string))
       ((= 5 counter) (list :a5 data-string))
       ((= 6 counter) (list :a6 data-string))
       ((= 7 counter) (list :a7 data-string))
       ((= 8 counter) (list :a8 data-string))
       ((= 9 counter) (list :a9 data-string))
       ((= 10 counter) (list :aa data-string))
       ((= 11 counter) (list :ab data-string))
       ((= 12 counter) (list :ac data-string))
       ((= 13 counter) (list :ad data-string))
       ((= 14 counter) (list :ae data-string))
       ((= 15 counter) (list :af data-string))))
    ((string-equal "b" line-prefix)
     (cond
       ((= 0 counter) (list :b0 data-string))
       ((= 1 counter) (list :b1 data-string))
       ((= 2 counter) (list :b2 data-string))
       ((= 3 counter) (list :b3 data-string))
       ((= 4 counter) (list :b4 data-string))
       ((= 5 counter) (list :b5 data-string))
       ((= 6 counter) (list :b6 data-string))
       ((= 7 counter) (list :b7 data-string))
       ((= 8 counter) (list :b8 data-string))
       ((= 9 counter) (list :b9 data-string))
       ((= 10 counter) (list :ba data-string))
       ((= 11 counter) (list :bb data-string))
       ((= 12 counter) (list :bc data-string))
       ((= 13 counter) (list :bd data-string))
       ((= 14 counter) (list :be data-string))
       ((= 15 counter) (list :bf data-string))))
    ((string-equal "c" line-prefix)
     (cond
       ((= 0 counter) (list :c0 data-string))
       ((= 1 counter) (list :c1 data-string))
       ((= 2 counter) (list :c2 data-string))
       ((= 3 counter) (list :c3 data-string))
       ((= 4 counter) (list :c4 data-string))
       ((= 5 counter) (list :c5 data-string))
       ((= 6 counter) (list :c6 data-string))
       ((= 7 counter) (list :c7 data-string))
       ((= 8 counter) (list :c8 data-string))
       ((= 9 counter) (list :c9 data-string))
       ((= 10 counter) (list :ca data-string))
       ((= 11 counter) (list :cb data-string))
       ((= 12 counter) (list :cc data-string))
       ((= 13 counter) (list :cd data-string))
       ((= 14 counter) (list :ce data-string))
       ((= 15 counter) (list :cf data-string))))
    ((string-equal "d" line-prefix)
     (cond
       ((= 0 counter) (list :d0 data-string))
       ((= 1 counter) (list :d1 data-string))
       ((= 2 counter) (list :d2 data-string))
       ((= 3 counter) (list :d3 data-string))
       ((= 4 counter) (list :d4 data-string))
       ((= 5 counter) (list :d5 data-string))
       ((= 6 counter) (list :d6 data-string))
       ((= 7 counter) (list :d7 data-string))
       ((= 8 counter) (list :d8 data-string))
       ((= 9 counter) (list :d9 data-string))
       ((= 10 counter) (list :da data-string))
       ((= 11 counter) (list :db data-string))
       ((= 12 counter) (list :dc data-string))
       ((= 13 counter) (list :dd data-string))
       ((= 14 counter) (list :de data-string))
       ((= 15 counter) (list :df data-string))))
    ((string-equal "e" line-prefix)
     (cond
       ((= 0 counter) (list :e0 data-string))
       ((= 1 counter) (list :e1 data-string))
       ((= 2 counter) (list :e2 data-string))
       ((= 3 counter) (list :e3 data-string))
       ((= 4 counter) (list :e4 data-string))
       ((= 5 counter) (list :e5 data-string))
       ((= 6 counter) (list :e6 data-string))
       ((= 7 counter) (list :e7 data-string))
       ((= 8 counter) (list :e8 data-string))
       ((= 9 counter) (list :e9 data-string))
       ((= 10 counter) (list :ea data-string))
       ((= 11 counter) (list :eb data-string))
       ((= 12 counter) (list :ec data-string))
       ((= 13 counter) (list :ed data-string))
       ((= 14 counter) (list :ee data-string))
       ((= 15 counter) (list :ef data-string))))
    ((string-equal "f" line-prefix)
     (cond
       ((= 0 counter) (list :f0 data-string))
       ((= 1 counter) (list :f1 data-string))
       ((= 2 counter) (list :f2 data-string))
       ((= 3 counter) (list :f3 data-string))
       ((= 4 counter) (list :f4 data-string))
       ((= 5 counter) (list :f5 data-string))
       ((= 6 counter) (list :f6 data-string))
       ((= 7 counter) (list :f7 data-string))
       ((= 8 counter) (list :f8 data-string))
       ((= 9 counter) (list :f9 data-string))
       ((= 10 counter) (list :fa data-string))
       ((= 11 counter) (list :fb data-string))
       ((= 12 counter) (list :fc data-string))
       ((= 13 counter) (list :fd data-string))
       ((= 14 counter) (list :fe data-string))
       ((= 15 counter) (list :ff data-string))))
    (T ()))
  )

(defun read-signed-int (data-string)
  (multiple-value-bind (number digits)
      (parse-integer data-string :radix 16)
    (setf digits (* digits 4))
    (if (>= number (expt 2 (- digits 1)))
	(- number (expt 2 digits))
	number)))

(defun convert-line-to-list (read-string)
  (let ((prefix (subseq read-string 0 1))
	(workstring (subseq read-string 3))
	(ret ()))
    (dotimes (counter 16)
      (if (< 2 (length workstring))
	  (progn (setf workstring (subseq workstring 1))
		 (if (not (string-equal " " (subseq workstring 0 1)))
		     (progn
		       (setf ret (append ret
					 (make-plist
					  (subseq workstring 0 2)
					  prefix counter)))))
		       (setf workstring (subseq workstring 2)))))
    ret))

(defun read-dump-file (filename)
  (with-open-file (dump-data filename)
    (let ((ret ()) (current-string (read-line dump-data)))
      (do () ((eq current-string :eof))
	(if (not (search "0123456789abcdef" current-string))
	    (setf ret (append ret (convert-line-to-list current-string))))
	(setf current-string (read-line dump-data nil :eof)))
      ret)))

(defvar *trimming* (read-dump-file "/var/measurement/trimming"))

(defun get-dig-T1 ()
  (parse-integer
   (concatenate 'string (getf *trimming* :89)(getf *trimming* :88))
   :radix 16))

(defun get-dig-T2 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :8B)(getf *trimming* :8A))))

(defun get-dig-T3 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :8D)(getf *trimming* :8C))))

(defun get-dig-P1 ()
  (parse-integer
   (concatenate 'string (getf *trimming* :8F)(getf *trimming* :8E))
   :radix 16))

(defun get-dig-P2 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :91)(getf *trimming* :90))))

(defun get-dig-P3 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :93)(getf *trimming* :92))))

(defun get-dig-P4 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :95)(getf *trimming* :94))))

(defun get-dig-P5 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :97)(getf *trimming* :96))))

(defun get-dig-P6 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :99)(getf *trimming* :98))))

(defun get-dig-P7 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :9B)(getf *trimming* :9A))))

(defun get-dig-P8 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :9D)(getf *trimming* :9C))))

(defun get-dig-P9 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :9F)(getf *trimming* :9E))))

(defun get-dig-H1 ()
  (parse-integer (getf *trimming* :A1) :radix 16))

(defun get-dig-H2 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :E2)(getf *trimming* :E1))))

(defun get-dig-H3 ()
  (parse-integer (getf *trimming* :e3) :radix 16))

(defun get-dig-H4 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :E4)
		(subseq (getf *trimming* :E5) 1))))

(defun get-dig-H5 ()
  (read-signed-int
   (concatenate 'string (getf *trimming* :E6)
		(subseq (getf *trimming* :E5) 0 1))))

(defun get-dig-H6 ()
  (read-signed-int (getf *trimming* :E7)))

(defun get-adc-t (data-list)
  (parse-integer (concatenate 'string
			      (getf data-list :fA)
			      (getf data-list :FB)
			      (subseq (getf data-list :FC) 0 1)) :radix 16))

(defun get-temp (data-list)
  (/ (get-t-fine data-list) 5120.0))

(defun get-t-fine (data-list)
  (let (var1 var2)
    (setf var1 (* (- (/ (get-adc-T data-list) 16384.0d0)
		     (/ (get-dig-T1) 1024.0d0)) (get-dig-T2)))
    (setf var2  (* (- (/ (get-adc-T data-list) 131072.0d0)
		      (/ (get-dig-T1) 8192.0d0))
		   (- (/ (get-adc-T data-list) 131072.0d0)
		      (/ (get-dig-T1) 8192.0d0)) (get-dig-T3)))
    (+ var1 var2)))

(defun get-adc-p (data-list)
  (parse-integer (concatenate 'string
			      (getf data-list :f7)
			      (getf data-list :F8)
			      (subseq (getf data-list :F9) 0 1)) :radix 16))

(defun get-pressure (data-list)
  (let ((var1 (- (/ (get-t-fine data-list) 2.0d0) 64000.0d0)) var2 p)
    (setf var2 (* var1 var1 (/ (get-dig-p6) 32768.0d0)))
    (setf var2 (+ var2 (* var1 (get-dig-p5) 2.0d0)))
    (setf var2 (+ (/ var2 4.0d0) (* (get-dig-p4) 65536.0d0)))
    (setf var1 (/ (+ (* (get-dig-p3) var1 var1 (/ 524288.0d0))
		  (* (get-dig-P2) var1)) 524288.0d0))
    (setf var1 (* (+ 1.0 (/ var1 32768.0d0)) (get-dig-p1)))
    (if (= 0.0 var1)
	0
	(progn
	  (setf p (- 1048576.0d0 (get-adc-p data-list)))
	  (setf p (* (- p (/ var2 4096.0d0)) (/ 6250.0d0 var1)))
	  (setf var1 (* (get-dig-p9) p (/ p 2147483648.0d0)))
	  (setf var2 (* p (/ (get-dig-p8) 32768.0d0)))
	  (+ p (/ (+ var1 var2 (get-dig-p7)) 16.0d0))))))

(defun get-p-hpa (data-list)
  (/ (get-pressure data-list) 100.0d0))

(defun get-adc-hum (data-list)
  (parse-integer
   (concatenate 'string (getf data-list :FD)(getf data-list :FE))
   :radix 16))

(defun get-hum (data-list)
  (let ((var_H (- (get-t-fine data-list) 76800.0d0)))
    (* (- (get-adc-hum data-list)
	  (+ (* (get-dig-H4) 64.0d0)
	     (* (get-dig-H5) (/ 16384.0d0) var_H)))
       (* (get-dig-H2) (/ 65536.0d0)
	  (+ 1.0d0 (* (get-dig-H6)
		      (/ 67108864.0d0) var_H
		      (+ 1.0d0 (* (get-dig-H3) (/ 67108864.0d0) var_H))))))))

(defun make-site-contents ()
  (let ((current-values-CO2 ()) (current-values-eTVOC ())
	(current-values-temp ()) (current-values-hum ())
	(current-values-press ())
	current-line last-CO2 last-eTVOC last-temp last-hum last-press)
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
				 (subseq current-line 15 19)))))))
      (ignore-errors
	(setf current-line
	      (read-dump-file
	       (format nil "/var/measurement/temperature-sicher~a" (- 99 i))))
	(setf current-values-temp (append current-values-temp
					  (list (get-temp current-line))))
	(setf current-values-press (append current-values-press
					  (list (get-p-hpa current-line))))
	(setf current-values-hum (append current-values-hum
					  (list (get-hum current-line))))))
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
    (setf current-line (read-dump-file "/var/measurement/temperature"))
    (setf last-temp (get-temp current-line))
    (setf last-hum (get-hum current-line))
    (setf last-press (get-p-hpa current-line))
    (setf current-values-hum (append current-values-hum (list last-hum)))
    (setf current-values-press (append current-values-press (list last-press)))
    (setf current-values-temp (append current-values-temp (list last-temp)))
    (with-open-file
	(CO2-output "/var/measurement/CO2.dat"
		    :direction :output :if-exists :supersede
				     :if-does-not-exist :create)
      (with-open-file (eTVOC-output "/var/measurement/eVOC.dat"
				    :direction :output :if-exists :supersede
				     :if-does-not-exist :create)
	(dotimes (i (length current-values-CO2))
	  (format CO2-output "~a ~a~%" i (nth i current-values-CO2))
	  (format eTVOC-output "~a ~a~%" i (nth i current-values-eTVOC)))))
    (with-open-file (hum-output "/var/measurement/hum.dat" :direction
				:output :if-exists :supersede
				     :if-does-not-exist :create)
      (with-open-file (press-output "/var/measurement/press.dat" :direction
				    :output :if-exists :supersede
				     :if-does-not-exist :create)
	(with-open-file (temp-output "/var/measurement/temp.dat" :direction
				     :output :if-exists :supersede
				     :if-does-not-exist :create)
	  (dotimes (i (length current-values-press))
	    (format press-output "~a ~a~%" i
		    (round (nth i current-values-press)))
	    (format hum-output "~a ~,1f~%" i (nth i current-values-hum))
	    (format temp-output "~a ~,2f~%" i (nth i current-values-temp))
	    ))))
    (with-open-file (site-output "/var/www/html/index.html"
				 :direction :output :if-exists :supersede
				     :if-does-not-exist :create)
      (format site-output "~a" "<HTML><HEAD><Title>Luftmesswerte</Title>")
      (format site-output "~a" "<META http-equiv=\"refresh\" content=\"60\">")
      (format site-output "~a"
	      "</HEAD><BODY><TABLE><TR><TD><H2>CO<sub>2</sub> Messwerte:</H2>")
      (format site-output "~a~a~a" "Aktueller CO<sub>2</sub> Messwert: "
	      last-CO2 " ppm." )
      (format site-output "~a~a~a" "<br>L&uuml;ften ist "
	      (if (> last-CO2 1000) "n&ouml;tig"
		  (if (> last-CO2 700) "ratsam" "nicht n&ouml;tig"))
	      ".</TD><TD>")
      (format site-output "~a" "die letzten CO<sub>2</sub> Messwerte:<BR>")
      (format site-output "~a"
	      "<IMG src=\"CO2.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR><TR><TD>")
      (format site-output "~a"
	      "<H2>Menge an fl&uuml;chtigen organischen Stoffen:</H2>")
      (format site-output "~a~a~a" "Aktueller Messwert: " last-eTVOC " ppb.")
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"eVOC.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "<TR><TD>")
      (format site-output "~a" "<H2>Luftfeuchtigkeit:</H2>")
      (format site-output "aktueller Messwert: ~,1f%." last-hum)
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"hum.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "<TR><TD>")
      (format site-output "~a" "<H2>Temperatur:</H2>")
      (format site-output "aktueller Messwert: ~,2f &deg;C." last-temp)
      (format site-output "~a" "</TD><TD>die letzten Messwerte:<BR><BR>")
      (format site-output "~a"
	      "<IMG src=\"temp.png\" alt=\"die letzten 100 Messwerte\">")
      (format site-output "~a" "</TD></TR>")
      (format site-output "~a" "<TR><TD>")
      (format site-output "~a" "<H2>Luftdruck:</H2>")
      (format site-output "aktueller Messwert: ~a hPa." (round last-press))
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
