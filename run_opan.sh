#!/bin/sh
if [ ! -x pans ]; then opan init; fi
opan daemon -l http://*:8080/
