#!/bin/sh
REPO="https://github.com/nokdoot/blog_villain"

missing () {
    echo '';
    echo "! $1 is missing.";
}

install_bin () {
    yes | pacman -S "$1"
    if [[ $? -ne 0 ]]; then
        echo "! installing $! failed";
        exit 1;
    fi
}

init_bins () {
    for bin in "$@";
    do
        location=$(which "$bin");
        [[ -z "$location" ]] && missing "$bin" && install_bin "$bin";
        echo "$bin";
    done
}

git_clone () {
    echo "> $git clone --branch master $REPO";
    "$git" clone --branch master "$REPO"
}

init_bins 'perl' 'git';
# cd로 이동해서 설치하는 기능 추가
