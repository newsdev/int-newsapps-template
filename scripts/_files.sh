#!/bin/bash

function init_dirs {
    echo "🚀    1. Creating directories"
    mkdir ../nyt-$NAME &> $LOGFILE_PATH
}

function copy_files {
    echo "🚀    2. Copying files"
    cp -R $TYPE/* ../nyt-$NAME &> $LOGFILE_PATH
    mv ../nyt-$NAME/MYAPP ../nyt-$NAME/$NAME &> $LOGFILE_PATH
    cp -R common/* ../nyt-$NAME/ &> $LOGFILE_PATH
}