#!/bin/bash
/usr/sbin/i2cset -y 2 0x77 0xf2 1
/usr/sbin/i2cset -y 2 0x77 0xf4 0x27
/usr/sbin/i2cset -y 2 0x5a 0xf4
/usr/sbin/i2cset -y 2 0x5a 0x01 0x20
