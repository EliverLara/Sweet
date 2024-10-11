#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

BRANCH=$(basename $(git symbolic-ref HEAD 2>/dev/null))

if [ "$BRANCH" != "master" ]; then
    THEME_NAME="Sweet-${BRANCH}"
elif [ "$BRANCH" == "master" ]; then
    THEME_NAME="Sweet"
fi

for  screen in '' '-hdpi' '-xhdpi'; do

    case "${screen}" in
    -hdpi)
        DPI='144'
        ;;
    -xhdpi)
        DPI='192'
        ;;
    *)
        DPI='96'
        ;;
    esac

    ASSETS_DIR="${THEME_NAME}${screen}/xfwm4"
    mkdir -p $ASSETS_DIR
    
    for i in assets/*; do  

        BASE_FILE_NAME=`basename -s .svg $i`

        if [ -f $ASSETS_DIR/$BASE_FILE_NAME.png ]; then
            echo $ASSETS_DIR/$BASE_FILE_NAME.png exists.
        else
            echo
            echo Rendering $ASSETS_DIR/$BASE_FILE_NAME.png
            $INKSCAPE --export-dpi=$DPI \
                    --export-filename=$ASSETS_DIR/$BASE_FILE_NAME.png $i \
            && $OPTIPNG -o7 --quiet $ASSETS_DIR/$BASE_FILE_NAME.png
        fi
    done
done
exit 0
