#!/bin/sh
unset GIT_DIR

echo "starting git pull"
exec git pull origin master
echo "finished!"
