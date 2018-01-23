#!/bin/bash

function init_git {
    echo "🚀    3. Initializing as a Git repository"
    cp -R ../nyt-$NAME/gitignore ../nyt-$NAME/.gitignore >>$LOGFILE_PATH 2>>$LOGFILE_PATH
    rm -rf ../nyt-$NAME/.git >>$LOGFILE_PATH 2>>$LOGFILE_PATH
    cd ../nyt-$NAME >>$LOGFILE_PATH 2>>$LOGFILE_PATH
    git init >>$LOGFILE_PATH 2>>$LOGFILE_PATH
}