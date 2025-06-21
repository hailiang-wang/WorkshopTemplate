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

if [ ! -d dist ]; then
    mkdir dist
else
    rm -rf dist
    mkdir dist
fi


echo "Generate Manual ..."
# Install https://github.com/hailiang-wang/markup-markdown
cd $baseDir/../sessions
rm MANUAL.md
markup MANUAL.m.md -o MANUAL.md

if [ ! -f MANUAL.md ]; then
    echo "File MANUAL.md not exist"
    exit 1
else
    cd $baseDir/../sessions
    # Fix Char errors
    # https://blog.csdn.net/subtitle_/article/details/127602227
    # Use shell `fc-list :lang=zh` to list all available fonts, e.g. Kaiti
    rm MANUAL.pdf
    pandoc -i MANUAL.md -o MANUAL.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'

    if [ $? -eq 0 ]; then
        echo "Generate separated files ..."
        cd $baseDir/../sessions
        for x in *; do
            cd $baseDir/../sessions
            if [[ -d $x ]] && [[ -f $x/README.md ]]; then
                cd $x
                rm README.pdf
                pandoc -i README.md -o README.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'
            fi
        done
    fi

    pwd
    echo "Generated MANUAL.pdf and followings." 
fi

echo "Generate Coach guidelines ..."
cd $baseDir/..
rm COACH.md COACH.pdf
markup COACH.m.md -o COACH.md
pandoc -i COACH.md -o COACH.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'
echo "Generated COACH.pdf and followings." 


echo "Generate Workouts ..."
cd $baseDir/../workouts
rm README.md README.pdf
markup README.m.md -o README.md
pandoc -i README.md -o README.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'


echo "ALL Done."