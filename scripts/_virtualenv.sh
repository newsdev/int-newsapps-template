#!/bin/bash

function init_virtualenv {
    echo "🚀    4. Creating and configuring a virtualenv"
    mkvirtualenv $NAME --python $(which python3) >>$LOGFILE_PATH 2>>$LOGFILE_PATH
    workon $NAME 2>>$LOGFILE_PATH
    echo "cd $DIR/nyt-$NAME/" > "$VIRTUALENVWRAPPER_HOOK_DIR/$NAME/bin/postactivate"
    DB_NAME=_DB_NAME
    DB_USER=_DB_USER
    echo "export $NAME$DB_NAME=nyt_dev_$NAME" >> "$VIRTUALENVWRAPPER_HOOK_DIR/$NAME/bin/postactivate"
    echo "export $NAME$DB_USER=nyt_dev_$NAME" >> "$VIRTUALENVWRAPPER_HOOK_DIR/$NAME/bin/postactivate"
    add2virtualenv .
    add2virtualenv config
    add2virtualenv $NAME
}

function init_pip {
    echo "🚀    5. Installing requirements"
    pip install -r requirements.txt >>$LOGFILE_PATH 2>>$LOGFILE_PATH
}