#!/bin/bash
/usr/sbin/i2cdump -y -r 0xf7-0xfe 2 0x77 > /var/measurement/temperature
chmod a+r /var/measurement/temperature
