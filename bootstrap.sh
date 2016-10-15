#!/bin/sh

# Clean the boilerplate
rm .git -rf
rm README.md

clonerep() {
    read -p "Do you want to clone $1 to this directory [y/n]?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
       git clone $1
    fi
}

addmodule() {
    read -p "Do you want to add $1 to the new repository [y/n]?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
       git submodule add $1
    fi
}

read -p "Do you want to initialize a new git repository? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git init
    git add main.tex Makefile
    touch README.md
    git add README.md localsettings.sty .gitignore
    addmodule http://github.com/hos/lazyeqn
else
    clonerep http://github.com/hos/lazyeqn
fi

mkdir -p img
mkdir -p fig

# remove this script itself
rm -- "$0"
