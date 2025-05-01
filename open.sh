PREFEDITOR="nvim"

if [[ "$1" ]]; then
    PREFEDITOR=$1
fi

$PREFEDITOR ./init.lua ./lua/plugins/config/* ./lua/plugins/*

