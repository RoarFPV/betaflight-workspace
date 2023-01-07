#!/bin/bash

# Script to update "upstream" remotes of submodule branches forked on github

function updateUpstream () {
    pushd $1

    git remote add upstream $2
    git checkout $3 && git pull upstream $3 && git push
    popd
    git add $1
}

updateUpstream "betaflight" "git@github.com:betaflight/betaflight.git" "master"
updateUpstream "unified-targets" "git@github.com:betaflight/unified-targets.git" "master"
updateUpstream "betaflight-configurator" "git@github.com:betaflight/betaflight-configurator.git" "master"
updateUpstream "blackbox-log-viewer" "git@github.com:betaflight/blackbox-log-viewer.git" "master"
updateUpstream "betaflight-tx-lua-scripts" "git@github.com:betaflight/betaflight-tx-lua-scripts.git" "master"
updateUpstream "hdzero/hdzero-vtx" "git@github.com:hd-zero/hdzero-vtx.git" "main"
updateUpstream "hdzero/hdzero-flasher" "git@github.com:bkleiner/hdzero-flasher.git" "master"
updateUpstream "hdzero/hdzero-goggle" "https://github.com/hd-zero/hdzero-goggle.git" "main"

echo "\n\nUpstream pull complete!\n\n"
git status