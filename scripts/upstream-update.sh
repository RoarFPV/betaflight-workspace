#!/bin/bash

# Script to update "upstream" remotes of submodule branches forked on github
# *Requires* each submodule to have an "upstream" remote already configured

function updateUpstream () {
    cd $1

    git remote add upstream $2
    git checkout master && git pull upstream master && git push
    cd ../
    git add $1
}

updateUpstream "betaflight" "git@github.com:betaflight/betaflight.git"
updateUpstream "unified-targets" "git@github.com:betaflight/unified-targets.git"
updateUpstream "betaflight-configurator" "git@github.com:betaflight/betaflight-configurator.git"
updateUpstream "blackbox-log-viewer" "git@github.com:betaflight/blackbox-log-viewer.git"
updateUpstream "betaflight-tx-lua-scripts" "git@github.com:betaflight/betaflight-tx-lua-scripts.git"

git status