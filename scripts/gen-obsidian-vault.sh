#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"` #add %3N as we want millisecond too

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..

if [ -d .obsidian ]; then
    echo `pwd`"/.obsidian exists" 
    echo "Done."
    echo "Open vault in obsidian with folde path:" `pwd`
    exit 0
fi

cp -rf assets/_obsidian .obsidian
echo "Done."
echo "Open vault in obsidian with folde path:" `pwd`