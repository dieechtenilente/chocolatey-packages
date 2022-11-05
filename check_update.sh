#!/bin/bash

curl -s https://mobaxterm.mobatek.net/download-home-edition.html | sha256sum | diff -q mobaxterm.package - >> /dev/null
EXITCODE=$(echo $?)

if [[ $EXITCODE -gt 0  ]] ; then
        echo MobaXterm was updated
        curl -s https://mobaxterm.mobatek.net/download-home-edition.html | sha256sum > mobaxterm.package
fi
