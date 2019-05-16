case $# in
    0)
        mongo localhost:27017/test generate.js
        ;;
    1)
        sed -i -e "s/test/$1/g"  generate.js
        mongo localhost:27017/$1 generate.js
        sed -i -e "s/$1/test/g"  generate.js
        ;;
    2)
        re='^[0-9]+$'
        if ! [[ $2 =~ $re ]] ; then
            echo "Please make sure second argument is a number!"
        else
            sed -i -e "s/max = 100;/max = $2;/g"  generate.js
            sed -i -e "s/test/$1/g"  generate.js
            mongo localhost:27017/$1 generate.js
            sed -i -e "s/$1/test/g"  generate.js
            sed -i -e "s/max = $2;/max = 100;/g"  generate.js
        fi
        ;;
    *)
        echo "Arguments can be: none/database/database name!"
        ;;
esac
