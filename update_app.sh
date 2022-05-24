#!bin/bash

# git fetch

# git reset origin/main --hard

git fetch

if [[ -z $(git diff main origin/main) ]];then
    echo "No changes are detected"
else
    echo "New changes are detected"
    
    git clone --depth 1 https://github.com/sethusaim/WebApp-Service.git 

    git filter-branch --prune-empty --subdirectory-filter application HEAD
fi
