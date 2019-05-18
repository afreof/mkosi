#!/bin/bash

set -ex

testimg()
{
	img="$1"
	sudo ./mkosi --default ./mkosi.files/mkosi."$img"
	test -f mkosi.output/"$img".raw
	rm mkosi.output/"$img".raw
}

# Only test ubuntu images for now, as semaphore is based on Ubuntu
for i in ./mkosi.files/mkosi.ubuntu*
do
	imgname="$(basename "$i" | cut -d. -f 2-)"
	testimg "$imgname"
done
