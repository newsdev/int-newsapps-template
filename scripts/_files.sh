#!/bin/bash

function init_dirs {
    echo "🚀    1. Creating directories"
    mkdir ../nyt-$NAME &> $LOGFILE_PATH
}

function copy_files {
    echo "🚀    2a. Copying files"
    cp -R $TYPE/* ../nyt-$NAME &> $LOGFILE_PATH
    mv ../nyt-$NAME/MYAPP ../nyt-$NAME/$NAME &> $LOGFILE_PATH
    cp -R common/* ../nyt-$NAME/ &> $LOGFILE_PATH
}

function edit_files {
    echo "🚀    2b. Editing files"

    declare -a files_to_edit=(
    "config/dev/settings.py"
    "config/stg/settings.py"
    "config/prd/settings.py"
    "README.md"
    )

    for i in "${files_to_edit[@]}"
    do
        sed -i '' -e "s/MYAPP/$NAME/g" ../nyt-$NAME/$i
    done
}