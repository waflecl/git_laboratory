#!/bin/bash

#Service A
if ! test -f protos/service_A/.git; then
    git submodule add -b serviceA_proto git@github.com:penti2s/proto_test.git protos/service_A
else 
    echo "Starting git pull submodule"
    cd  protos/service_A/
    git pull 
    cd ../../
    echo "Finish git pull submodule"
fi

#Service B
if ! test -f protos/service_B/.git; then
    git submodule add -b serviceB_proto git@github.com:penti2s/proto_test.git protos/service_B
else 
    echo "Starting git pull submodule"
    cd  protos/service_B/
    git pull 
    cd ../../
    echo "Finish git pull submodule"
fi