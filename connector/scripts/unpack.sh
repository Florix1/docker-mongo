HERE=$(pwd)
STORAGE="/connector/backup"

if [ $# -ne 2 ]; then
    echo "How to use example : ./bonus old_name new_name"
else
    if [ -f $STORAGE/backup_$1.zip ]; then
        unzip $STORAGE/backup_$1.zip
        FILE=$(find  ./$1/ -type f -name "*.bson")
        mongorestore --collection $2 --db $2 $FILE
        rm -r ./$1
    else
        echo "Please enter database with a valid backup file!"
    fi
fi
