\#!/bin/zsh
files=`git ls-files -co --exclude-standard`
sb_files=`git --no-pager submodule --quiet foreach 'git ls-files --full-name -co --exclude-standard | sed s!^!$path/!'`
all_files=$files$sb_files

echo $all_files