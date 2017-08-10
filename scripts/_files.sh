#!/bin/bash

function init_dirs {
    echo "🚀    1. Creating directories"
    mkdir ../nyt-$NAME &> $LOGFILE_PATH
}

function copy_files {
    echo "🚀    2. Copying and editing files"
    cp -R $TYPE/* ../nyt-$NAME &> $LOGFILE_PATH
    mv ../nyt-$NAME/MYAPP ../nyt-$NAME/$NAME &> $LOGFILE_PATH
    cp -R common/* ../nyt-$NAME/ &> $LOGFILE_PATH

    # This is how you make an array of strings in bash.
    declare -a files_to_edit=(
    "config/dev/settings.py"
    "config/stg/settings.py"
    "config/prd/settings.py"
    "config/stg/app.ini"
    "config/prd/app.ini"
    "$NAME/templates/base.html"
    "README.md"
    )

    # Loop over the array and do a sed command to replace MYAPP.
    for i in "${files_to_edit[@]}"
    do
        # -i '' kills the backup file filename.ext-e sed creates.
        # -e is the command to run.
        # $i is the filename from the loop over the array of strings above.
        sed -i '' -e "s/MYAPP/$NAME/g" ../nyt-$NAME/$i
    done
}
