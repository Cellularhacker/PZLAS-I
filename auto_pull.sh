#!/bin/sh
unset GIT_DIR

PZLAS_HOME='/home/w3o4uls/PZLAS-I'

cd "$PZLAS_HOME"

echo "starting git pull"
exec git pull origin master
echo "finished!"
