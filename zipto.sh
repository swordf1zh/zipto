#!/usr/bin/bash

_INITPATH="$PWD"
_OUTPUTDIRBASE="$1"
_OUTPUTDIR=$(basename $2)
_OUTPUTPATH="$_OUTPUTDIRBASE/$_OUTPUTDIR"

echo "Creating backup folder ($_OUTPUTPATH)..."
[[ -d "$_OUTPUTPATH" ]] || mkdir -p "$_OUTPUTPATH"
echo ""
cd "$_OUTPUTPATH"
_OUTPUTPATH="$PWD"

cd "$_INITPATH"
cd "$2"
for _E in "$PWD"/*;
do
  _ENAME=$(basename "$_E")

  if [ -d "$_E" ]
  then
    _OUTPUTZIP="$_OUTPUTPATH/$_ENAME.zip"

    cd "$_E"
    echo "Zipping $_ENAME  --->  $_OUTPUTZIP ..."
    zip -r "$_OUTPUTZIP" *
    echo "Done!"
    echo ""
  else
    _TLFILES="${_TLFILES:-1}"
  fi

done

if [[ ! -z $_TLFILES ]]
then
  echo "$_TLFILES"
  echo "---------"
  _OUTPUTZIP="$_OUTPUTPATH/$_OUTPUTDIR.zip"
  echo "Zipping files in parent folder  ---> $_OUTPUTZIP ..."
  cd "$_INITPATH"
  cd "$2"
  find . -maxdepth 1 -type f -exec zip $_OUTPUTZIP {} \;
  echo "Done!"
  echo ""
fi

