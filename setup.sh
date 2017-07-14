#!/bin/bash
source /usr/local/bin/virtualenvwrapper.sh

while getopts t:n: option
do
 case "${option}"
 in
 t) TYPE=${OPTARG};;
 n) NAME=${OPTARG};;
 esac
done

if [[ -z $TYPE ]] ; then
    echo "ERROR: Need to specify a project type with -t. Supports django, flask"
    exit 1
fi

if [[ -z $NAME ]] ; then
    echo "ERROR: Need to specify a project name with -n."
    exit 1
fi

if [ $TYPE == "django" ] ; then
    echo "* SETTING UP A $TYPE PROJECT CALLED $NAME"
    echo "* CREATING DIRECTORIES"
    mkdir ../nyt-$NAME
    echo "* COPYING FILES"
    cp -R django/* ../nyt-$NAME
    mv ../nyt-$NAME/MYAPP ../nyt-$NAME/$NAME
    cp -R common/* ../nyt-$NAME/
    cp -R ../nyt-$NAME/gitignore ../nyt-$NAME/.gitignore
    rm -rf ../nyt-$NAME/.git
    cd ../nyt-$NAME
    echo "* GIT MAGICK MOSTE FOULE"
    git init > /dev/null
    echo "* VIRTUALENV THINGS"
    mkvirtualenv $NAME > /dev/null
    workon $NAME
    echo "* PIP INSTALLING"
    pip install -r requirements.txt > /dev/null
fi

echo "* CLEANUP AND GETTING STARTED"
echo "cd ~/src/nyt/nyt-$NAME/" > "$VIRTUALENVWRAPPER_HOOK_DIR/$NAME/bin/postactivate"
workon $NAME

echo "* TYPE 'workon $NAME' TO GET STARTED"

exit 0