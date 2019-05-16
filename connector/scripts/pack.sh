HERE=$(pwd)
STORAGE="/connector/backup/"

if [ $# -ne 1 ]; then
    echo "How to use example : ./pack.sh database_name"
else
    if [ -d /data/db/$1 ]; then
        echo "Please wait!"
        mongodump --db $1
        cd ./dump
        zip -r $STORAGE/backup_$1.zip $1/
        cd -
        rm -r ./dump
    else
        echo "Please enter a valid database!"
    fi
fi
