#! /bin/bash

#file=$(echo ${PWD##*/} | tr -d '[:punct:]')

IFS=$(echo -en "\n\b")
shopt -s nullglob
for i in *.MTS *.MXF
do
  ffmpeg -i "$i" -vcodec mpeg4 -b:v 15M -acodec libmp3lame -b:a 192k "${i%.*}.MP4"
done

if [[ ! -e $to_delete]]
then
  mkdir to_delete
fi
mv *.MP4 to_delete
