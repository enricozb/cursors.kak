# sublime-like multiple cursor behavior

define-command sublime-multi-cursor %{
  execute-keys -save-regs '' %sh{
    if [[ $kak_reg_hash = 1 ]] && [[ ${#kak_selection} = 1 ]]; then
      # check if the character under the cursor is space or tab
      # from: https://unix.stackexchange.com/a/146945
      if [[ -z "${kak_reg_dot//[[:blank:]]}" ]]; then
        echo ": echo -debug 'in spaces'<ret>";
        printf %s '<a-i><space>';

      # check if the character under the cursor is some other whitespace
      # this is needed because <a-i><space> doesn't work on newline
      elif [[ -z "${kak_reg_dot//[[:space:]]}" ]]; then
        echo ": echo -debug 'in spaces'<ret>"
        printf %s '*N';

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

map global normal <c-e> *N
map global normal <c-d> ': sublime-multi-cursor<ret>'
map global normal <c-u> <a-,>
