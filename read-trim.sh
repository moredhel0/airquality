#!/bin/bash
/usr/sbin/i2cdump -y -r 0x88-0xa1 2 0x77 > /var/measurement/trimming
/usr/sbin/i2cdump -y -r 0xe1-0xe6 2 0x77 >> /var/measurement/trimming
chmod a+r /var/measurement/trimming
