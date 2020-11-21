#!/bin/bash
for i in {99..0}
    do 
	num=$((1 +$i))
	cp /var/measurement/CO2-sicher$i /var/measurement/CO2-sicher$num
	cp /var/measurement/temperature-sicher$i /var/measurement/temperature-sicher$num
    done
cp /var/measurement/CO2-data /var/measurement/CO2-sicher0
cp /var/measurement/temperature /var/measurement/temperature-sicher0