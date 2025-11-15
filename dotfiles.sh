#!/bin/sh

ORIGINALPATH="$(pwd)"

cd ~/dotfiles || exit

git add --all
git commit
git push origin main:main 

cd "${ORIGINALPATH}" || exit
