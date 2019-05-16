DIR="/connector/scripts"

case $# in
    0)
        mongo localhost:27017/test $DIR/generate.js
        ;;
    1)
        sed -i -e "s/test/$1/g"  $DIR/generate.js
        mongo localhost:27017/$1 $DIR/generate.js
        sed -i -e "s/$1/test/g"  $DIR/generate.js
        ;;
    2)
        re='^[0-9]+$'
        if ! [[ $2 =~ $re ]] ; then
            echo "Please make sure second argument is a number!"
        else
            sed -i -e "s/max = 100;/max = $2;/g"  $DIR/generate.js
            sed -i -e "s/test/$1/g"  $DIR/generate.js
            mongo localhost:27017/$1 $DIR/generate.js
            sed -i -e "s/$1/test/g"  $DIR/generate.js
            sed -i -e "s/max = $2;/max = 100;/g"  $DIR/generate.js
        fi
        ;;
    *)
        echo "Arguments can be: none/database/database name!"
        ;;
esac
