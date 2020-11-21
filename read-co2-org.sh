#!/bin/bash
/usr/sbin/i2ctransfer -y 2 w1@0x5a 0x02 r8 > /var/measurement/CO2-data
chmod a+r /var/measurement/CO2-data
