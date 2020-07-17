# sublime-like multiple cursor behavior

define-command sublime-multi-cursor %{
  execute-keys %sh{
    if [[ $kak_reg_hash = 1 ]] && [[ ${#kak_selection} = 1 ]]; then
      # if we are going to select whitespace
      if [[ $kak_reg_dot =~ "[[:space:]]*" ]]; then
        printf %s '<a-i><space>';

      # if we are going to select an alphanumeric + [_-],
      # select a word
      elif [[ $kak_reg_dot =~ [a-zA-Z0-9_-] ]]; then
        printf %s '<a-i>w';

      # otherwise, select a WORD
      # see (:doc keys) for definitions of WORD v word
      else
        printf %s '<a-i><a-w>*';
      fi
    else
      printf %s "*N"
    fi
  }

  execute-keys %sh{
    if [[ $kak_reg_hash = 1 ]] && [[ ${#kak_selection} = 1 ]]; then
      printf %s "*N"
    fi
  }
}

map global normal <c-d> ': sublime-multi-cursor<ret>'
