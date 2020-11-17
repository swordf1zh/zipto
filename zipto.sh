#!/usr/bin/bash

cd $2

_OUTPUTDIRBASE="$1"
_OUTPUTDIR="$_OUTPUTDIRBASE/$(basename $2)"

echo "Creating backup folder ($_OUTPUTDIR)..."
[[ -d "$_OUTPUTDIR" ]] || mkdir -p "$_OUTPUTDIR"
echo ""

for _FILEPATH in "$PWD"/*;
do
  _DIRNAME=$(basename "$_FILEPATH")
  _OUTPUTZIP="$_OUTPUTDIR/$_DIRNAME.zip"

  cd "$_FILEPATH"
  echo "Zipping $_DIRNAME  --->  $_OUTPUTZIP ..."
  zip -r "$_OUTPUTZIP" *

echo "Done!"
  echo ""
done

