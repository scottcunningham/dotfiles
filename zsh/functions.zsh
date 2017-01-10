function show-repo {
    git remote -v | grep origin | awk ' { print $2 }' | uniq | tr ':' '/' | sed "s|git\@|https://|"
}

function repo {
    show-repo | xargs open
}

function prs {
    echo $(show-repo)/pull-requests | xargs open
}
