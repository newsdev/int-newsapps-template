#!/bin/bash

function init_db {
    echo "🚀    6. Creating and configuring the database"
    createdb nyt_dev_$NAME >> $LOGFILE_PATH 2>>&1
    createuser nyt_dev_$NAME >> $LOGFILE_PATH 2>>&1
    psql -c "alter user nyt_dev_$NAME with superuser;" >> $LOGFILE_PATH 2>>&1
}