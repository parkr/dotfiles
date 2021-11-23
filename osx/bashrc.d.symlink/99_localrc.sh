if [ -f "$HOME/.localrc" ]; then
  source $HOME/.localrc
fi

if [ -d "$HOME/.localrc.d" ]; then
 for i in ~/.localrc.d/*.sh; do
   source_sub_with_bench "$HOME/.bashrc.d/99_localrc.d" "$i"
 done; unset i
fi
