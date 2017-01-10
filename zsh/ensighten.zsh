function sshens {
    ssh -l scunn106 -i ~/.ssh/scunningham-prod.pem $@
}

function sshleg {
    ssh -l scunningham -i ~/.ssh/scunningham-prod.pem $@
}

function sshadm {
    ssh -l admin -i ~/.ssh/scunningham-dev.pem $@
}


function ens-clone {
    local repo=$1
    git clone git@bitbucket.org:ensighten-ondemand/$repo.git
}

#
# TAGMAN
#

export TAGMAN_CHEF_IDENTITY="alexr"
export TAGMAN_CHEF_CHECKOUT="$HOME/src/tagman/Chef-configurations"
export TAGMAN_CHEF_SERVER="prod"


