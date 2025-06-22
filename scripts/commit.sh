#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd -P `dirname "$0"`;pwd)
export PYTHONUNBUFFERED=1

# functions

# main
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
set -x
cd $baseDir/..
git add --all
msg="Update content"

if [ ! "$1" == '' ]; then
    msg="$*"
fi

git commit -m "$msg"
git push origin master