#!/bin/sh
set -e

cd ./src/

# Go through the /src/ file and try to run every file under git control
for i in *.jl; do
    printf "Testing file $i \n"
    julia $i
done

printf "Tests executed successfully\n."
