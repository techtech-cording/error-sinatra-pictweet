#!/bin/sh

cd ../
rm -rf error-sinatra-pictweet
git clone -b $1 https://github.com/Sasaki1994/error-sinatra-pictweet.git
cd error-sinatra-pictweet
bundle update
