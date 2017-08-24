#!/bin/bash

function init_db {
    echo "🚀    6. Creating and configuring the database"
    createdb nyt_dev_$NAME >>$LOGFILE_PATH 2>>$LOGFILE_PATH
    createuser nyt_dev_$NAME >>$LOGFILE_PATH 2>>$LOGFILE_PATH
    psql -c "alter user nyt_dev_$NAME with superuser;" >>$LOGFILE_PATH 2>>$LOGFILE_PATH
}