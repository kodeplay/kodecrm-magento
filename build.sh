#!/bin/sh

bdir=./build

for f in `find magento/ -type f`
do
    tdir=`echo "$f" | sed -e "s/^\/*//"`
    tdirname=`dirname $tdir`
    `mkdir -p $bdir/$tdirname`
    `cp -r $f ./$bdir/$tdirname/`
done

