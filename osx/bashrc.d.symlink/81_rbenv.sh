if [ -d "$HOME/.rbenv" ]; then
    # Usually we'd use $(brew --prefix openssl) but it takes too long.
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl"
    export PATH="$HOME/.rbenv/shims:${PATH}"
    export RBENV_SHELL=bash
    source_sub_with_bench "$HOME/.bashrc.d/81_rbenv.sh" "/usr/local/opt/rbenv/completions/rbenv.bash"
    # command rbenv rehash 2>/dev/null # skip this for now, since it's slow
    rbenv() {
        local command
        command="${1:-}"
        if [ "$#" -gt 0 ]; then
            shift
        fi

        case "$command" in
        rehash|shell)
            eval "$(rbenv "sh-$command" "$@")";;
        *)
            command rbenv "$command" "$@";;
        esac
    }
fi
