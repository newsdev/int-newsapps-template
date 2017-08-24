#!/bin/bash

function init_git {
    echo "🚀    3. Initializing as a Git repository"
    cp -R ../nyt-$NAME/gitignore ../nyt-$NAME/.gitignore >> $LOGFILE_PATH 2>>&1
    rm -rf ../nyt-$NAME/.git >> $LOGFILE_PATH 2>>&1
    cd ../nyt-$NAME >> $LOGFILE_PATH 2>>&1
    git init >> $LOGFILE_PATH 2>>&1
}