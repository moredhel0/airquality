#!/bin/bash
i2cset -y 2 0x77 0xf2 1
i2cset -y 2 0x77 0xf4 0x27
i2cset -y 2 0x5a 0xf4
i2cset -y 2 0x5a 0x01 0x20
