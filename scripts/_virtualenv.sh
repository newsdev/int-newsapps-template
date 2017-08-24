#!/bin/bash

function init_virtualenv {
    echo "🚀    4. Creating amd configuring a virtualenv"
    mkvirtualenv $NAME >> $LOGFILE_PATH 2>>&1
    workon $NAME >> $LOGFILE_PATH 2>>&1
    echo "cd ~/src/nyt/nyt-$NAME/" > "$VIRTUALENVWRAPPER_HOOK_DIR/$NAME/bin/postactivate"
}

function init_pip {
    echo "🚀    5. Installing requirements"
    pip install -r requirements.txt >> $LOGFILE_PATH 2>>&1
}