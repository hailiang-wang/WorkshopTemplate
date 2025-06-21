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
markup MANUAL.m.md -o dist/MANUAL.md

if [ ! -f dist/MANUAL.md ]; then
    echo "File dist/MANUAL.md not exist"
    exit 1
else
    cd dist
    # Fix Char errors
    # https://blog.csdn.net/subtitle_/article/details/127602227
    # Use shell `fc-list :lang=zh` to list all available fonts, e.g. Kaiti
    pandoc -i MANUAL.md -o MANUAL.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'
    cp MANUAL.pdf ../

    if [ $? -eq 0 ]; then
        echo "Generate separated files ..."
        cd $baseDir/..
        for x in *; do
            if [[ -d $x ]] && [[ -f $x/README.md ]]; then
                pandoc -i $baseDir/../$x/README.md -o $baseDir/../$x/README.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'
            fi
        done
    fi

    pwd
    echo "Generated MANUAL.pdf and followings." 
fi

echo "Generate Coach guidelines ..."
cd $baseDir/..
markup COACH.m.md -o dist/COACH.md
cd dist
pandoc -i COACH.md -o COACH.pdf --pdf-engine=xelatex -V CJKmainfont='HarmonyOS Sans SC'
cp COACH.pdf ../
echo "Generated COACH.pdf and followings." 