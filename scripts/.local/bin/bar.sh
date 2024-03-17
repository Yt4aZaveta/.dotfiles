#!/bin/sh

polybar-msg cmd quit
polybar mon0 2>&1 | tee -a /tmp/polybar-mon0.log &
disown
polybar mon1 2>&1 | tee -a /tmp/polybar_mon1.log &
disown
