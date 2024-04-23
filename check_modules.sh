#!/bin/bash
function syncronize()
{
    submodules=$(awk '/\[submodule/ {getline; print $3}' .gitmodules)

    for submodule in $submodules; do
        echo "Processing submodule: $submodule"


        if ! test -f "$submodule/.git"; then
            echo "Submodule not initialized. Adding submodule..."
            url=$(awk -v module="$submodule" '$2 == module {getline; print $3}' .gitmodules)
            branch=$(awk -v module="$submodule" '$2 == module {getline; getline; print $3}' .gitmodules)

            git submodule add -b "$branch" "$url" "$submodule"
        else
            echo "Starting git pull in submodule: $submodule"
            cd "$submodule"
            git pull
            cd -
            echo "Finished git pull in submodule: $submodule"
        fi
    done
}


if ! test -f .gitmodules; then
    git submodule add -b serviceA_proto git@github.com:penti2s/proto_test.git protos/service_A
    git submodule add -b serviceB_proto git@github.com:penti2s/proto_test.git protos/service_B
else
    syncronize
fi