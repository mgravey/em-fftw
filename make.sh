#!bin/bash

if [ -z ${EM_PATH+x} ]; then 
	echo "EM_PATH is unset"; 
	export EM_PATH="$(PWD)/test"
else 
	echo "EM_PATH is set to '$EM_PATH'"; 
fi

wget "http://www.fftw.org/fftw-3.3.6-pl2.tar.gz"
tar -xf fftw-3.3.6-pl2.tar.gz
cd fftw-3.3.6-pl2
emconfigure ./configure --disable-fortran --enable-float --prefix=$EM_PATH CFLAGS="-s WASM=1" CXXFLAGS="-s WASM=1"  LDFLAGS="-s WASM=1"  #--with-combined-threads
emmake make -j
emmake make install
