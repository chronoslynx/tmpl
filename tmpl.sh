#!/bin/bash

set -eu
ACTIONS=(new remove list)
SHORTACTIONS=(n rm ls)
TMPLPATH=${TMPLPATH:-"$HOME/.tmpl"}

function usage() {
    echo "usage: tmpl action path"
    echo "(short) actions"
    for action in ${SHORTACTIONS[@]}; do
        echo -e "\t$action"
    done
    echo "actions:"
    for action in ${ACTIONS[@]}; do
        echo -e "\t$action"
    done
    exit
}

function ensure_dir() {
    if [ ! -d "$1" ]; then
        mkdir "$1"
    else
        echo "$1 already exists!"
    fi
}

function check() {
    stat "$1" >/dev/null 2>&1
}

function new() {
    local name="$1"
    local path="$TMPLPATH/$1"
    check "$path" || cp -r "$2" "$path"
}

function list() {
    ls $TMPLPATH
}
