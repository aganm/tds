#!/bin/bash
cd src
find . -type f -name \* | while read file
do
	clang-format -i $file
done
cd ..
