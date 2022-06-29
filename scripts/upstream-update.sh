#!/bin/bash

# Script to update "upstream" remotes of submodule branches forked on github
# *Requires* each submodule to have an "upstream" remote already configured

function updateUpstream () {
    cd $1
    git checkout master && git pull upstream master && git push
    cd ../
    git add $1
}

updateUpstream "betaflight"
updateUpstream "unified-targets"
updateUpstream "betaflight-configurator"
updateUpstream "blackbox-log-viewer"
updateUpstream "betaflight-tx-lua-scripts"

git status