#!/bin/bash

# Source virtualenvwrapper
# Need access to this for mkvirtualenv
. /usr/local/bin/virtualenvwrapper.sh

# Load functions from these bash files.
# The _ in the filename indicates they are private
# aka not to be directly executed.
. scripts/_dashboard.sh      # show_dashboard 
. scripts/_database.sh       # init_db
. scripts/_files.sh          # init_dirs, copy_files 
. scripts/_git.sh            # init_git
. scripts/_virtualenv.sh     # init_virtualenv, init_pip

# Set some variables for text color.
BASE='\033[0m'
SUCCESS='\033[1;34m'
WARN='\033[1;33m'
FAILURE='\033[1;31m'
INFO='\033[1;36m'

# Set some other variables around output.
TIMESTAMP=$(date +%s)
SEPARATOR="======================================================"
LOGFILE_PATH="/tmp/int-newsapps-template-$NAME-$TIMESTAMP.log"

# Loop over options passed to the script.
# Look for t/n (type, name).
# Assign them to variables called TYPE and NAME.
while getopts t:n:d: option
do
 case "${option}"
 in
 t) TYPE=${OPTARG};;
 n) NAME=${OPTARG};;
 d) DIR=${OPTARG};;
 esac
done

# If we didn't get a type, bail with an error message.
if [[ -z $TYPE ]] ; then
    printf "${FAILURE}ERROR${BASE} ${WARN}Need to specify a project type with -t. Supports ${INFO}\`django\`${WARN} or ${INFO}\`flask\`${WARN}.${BASE}\n"
    exit 1
fi

# If we didn't get a name, bail with an error message.
if [[ -z $NAME ]] ; then
    printf "${FAILURE}ERROR${BASE} ${WARN}Need to specify a project name with -n.${BASE}\n"
    exit 1
fi

# If we didn't get a dir, assume ~/src/nyt/
if [[ -z $DIR ]] ; then
    printf "${WARN}No base directory supplied, assuming ~/src/nyt/. To specify a directory, use -d.${BASE}\n"
    DIR="~/src/nyt"
fi

### Run the process ###
echo $SEPARATOR
show_dashboard 2> $LOGFILE_PATH      # scripts/_dashboard.sh
echo $SEPARATOR
init_dirs 2> $LOGFILE_PATH           # scripts/_files.sh
copy_files 2> $LOGFILE_PATH          # scripts/_files.sh
init_git 2> $LOGFILE_PATH            # scripts/_git.sh
init_virtualenv 2> $LOGFILE_PATH     # scripts/_virtualenv.sh
init_pip 2> $LOGFILE_PATH            # scripts/_virtualenv.sh
init_db 2> $LOGFILE_PATH             # scripts/_database.sh
echo $SEPARATOR
printf "Type ${INFO}\`workon $NAME\`${BASE} to get started developing."
echo ""
echo ""

# Exit successfully.
exit 0