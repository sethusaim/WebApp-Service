#!bin/bash

if [[ -z $(git diff application) ]];then
    echo "No changes are detected"
else
    echo "New changes are detected"
    
    git clone --depth 1 https://github.com/sethusaim/WebApp-Service.git ./wafer_app

    cd ./wafer_app

    git filter-branch --prune-empty --subdirectory-filter application HEAD
fi
