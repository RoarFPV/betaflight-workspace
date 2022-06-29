#!/bin/bash

function updateUpstream () {
    cd $1
    git checkout master && git pull upstream master && git push
    cd ../
    git add $1
}

updateUpstream "betaflight"
updateUpstream "betaflight-configurator"
updateUpstream "blackbox-log-viewer"
updateUpstream "betaflight-tx-lua-scripts"
updateUpstream "unified-targets"

git status