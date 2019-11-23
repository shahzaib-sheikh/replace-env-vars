source=""
dest=""
prefix=""


if [ $# -eq 3 ]; then
    source=$1
    dest=$2
    prefix=$3

    if [ ! -f "$source" ];then 
        echo "source not found"
        exit 1
    fi

    if [ -f "$dest" ];then 
        echo "dest already exists overwriting"
    fi
    
    source_str=$(<"$source")
    
    # printf '%s' "$source_str"

    while read -r line; do
    if [[ $line == $prefix* ]];then

        key=$(echo "$line" | cut -d'=' -f 1)
        value=$(echo "$line" | cut -d'=' -f 2)
        echo "found ${key} relacing ..."
        bs_escaped_str=${value//\\/\\\\}
        fs_escaped_str=${bs_escaped_str////\\\/}
        am_escaped_str=${fs_escaped_str//&/\\\&}
        source_str=$(printf "%s" "$source_str" | sed s/"${key////\\\/}"/"${am_escaped_str}"/g)
    fi
    done <<< "$(env)"

    printf '%s' "$source_str" > $dest
else
    echo "not enough args"
    exit 1
fi
