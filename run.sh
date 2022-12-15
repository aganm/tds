#!/bin/bash

mkdir -p build

if [[ "$OSTYPE" == "msys" ]]; then
	cp lib/SDL2_image-2.0.5/x86_64-w64-mingw32/bin/*.dll build/
	cp lib/SDL2_mixer-2.0.4/x86_64-w64-mingw32/bin/*.dll build/
	cp lib/SDL2_net-2.0.1/x86_64-w64-mingw32/bin/*.dll build/
	cp lib/SDL2_ttf-2.0.15/x86_64-w64-mingw32/bin/*.dll build/
	cp lib/SDL2-2.0.18/x86_64-w64-mingw32/bin/*.dll build/
fi

cd build

export CC=tcc
#export CC=clang
#export CXX=clang

cmake .. -G "Ninja" -DCMAKE_BUILD_TYPE=Debug

cmake --build .

./wakeup*
