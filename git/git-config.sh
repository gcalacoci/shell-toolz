#!/bin/bash
# Standard shortcuts for my usual git configuration
#
# author = Giulio Calacoci <giulio.calacoci@2ndquadrant.it>
#
# this is the final template of the .gitconfig file
#
# [user]
# 	name = Giulio Calacoci
# 	email = giulio.calacoci@2ndquadrant.it
# [core]
# 	editor = vim
# [merge]
# 	tool = vimdiff
# [color]
# 	ui = true
# 	branch = auto
# 	diff = auto
# 	interactive = auto
# 	status = auto
# 	log = auto
# [diff]
# 	mnemonicprefix = true
# [rerere]
# 	enabled = true
# 	enable = true
# [branch]
# 	autosetuprebase = always
# [format]
# 	pretty = oneline
# [log]
# 	abbrevCommit = true
# 	decorate = true
#

# Who i'm and basic data
git config --global user.name "Giulio Calacoci"
git config --global user.email giulio.calacoci@2ndquadrant.com

# use vim and vimdiff for the sake of god!
git config --global core.editor vim
git config --global merge.tool vimdiff

# SVN-like shortcuts for often used commands:
git config --global alias.st status -bs
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cp cherry-pick


#from http://travisjeffery.com/b/2012/02/search-a-git-repo-like-a-ninja/
#NOTE: (--break, --heading) does not work with git 1.7.4.4, but works with 1.7.10.2
#git config --global alias.g "grep --break --heading --line-number"

# Colorized output:

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto

# pro tip from https://training.github.com/kit/advanced/#mastering-shortcuts-efficiencies
# Avoid repetitive conflicts, Reuse recorded resolution
git config --global rerere.enable true

#prune automatically http://stackoverflow.com/questions/18308535/automatic-prune-with-git-fetch-or-pull
git config --global remote.origin.prune true

# set oneline format
git config --global format.pretty oneline

#abbreviate commit hashes and add decoration for git log command
git config --global log.abbrevCommit true
git config --global log.decorate true

# git push local will create remote branch http://stackoverflow.com/questions/11872984
#git config --global push.default current
