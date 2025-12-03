#!/bin/bash

ORIGINALPATH="$(pwd)"
TODAY="$(date '+%d.%m.%y')"

cd ~/Documents/Vault || exit

git add --all
git commit -m "${TODAY}"
git push origin main:main 

cd "${ORIGINALPATH}" || exit
