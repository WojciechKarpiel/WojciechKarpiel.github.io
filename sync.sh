#!/bin/sh

set -ex

./compile-md.sh

rsync --exclude .git -avz -e "ssh -p 10239" . wkarpiel@maluch2.mikr.us:/home/wkarpiel/dokumenty/wojciechkarpiel-pl-static

