#!/bin/sh
set -e

RESET="\e[0m"
BOLD_GREEN="\e[1;32m"

mods=`git status -s | cut -c4- | awk -F'/' '{
if ($2!="")
	print $1
}' | uniq`

for mod in $mods; do
	version=`head "$mod/$mod.nuspec" | grep -oP '(?<=<version>).+(?=<\/version>)'`
	read -rp "`echo -e \"Update $BOLD_GREEN$mod to v$version$RESET? [Y/n]: \"`" answer
	if [[ $answer == 'n' ]]; then
		continue
	fi

	git add "$mod/"
	git commit -m "$mod: Update to v$version"
done
