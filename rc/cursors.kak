# sublime-like behavior on <c-d>

map global normal <c-d> ': sublime-multi-cursor<ret>'
map global normal <c-e> ': sublime-swap-mode<ret>'

# options for keeping track of whether or not we are in multi-cursor mode
declare-option -hidden str sublime_cursor_mode 'single'

set-option global modelinefmt "%{%opt{sublime_cursor_mode}} | %opt{modelinefmt}"

define-command -hidden sublime-swap-mode %{ evaluate-commands %sh{
  if [ "$kak_opt_sublime_cursor_mode" == "single" ]; then
    printf %s "set-option buffer sublime_cursor_mode multi";
  else
    printf %s "set-option buffer sublime_cursor_mode single";
  fi
}}

# save-regs here is so %reg{/} is not restored
define-command -hidden sublime-multi-cursor %{ execute-keys -save-regs '' %sh{
  # if we are in single cursor mode, and if the current selection is one char
  # we highlight the word/WORD, put it in %reg{/}, and set the mode to multi.
  if [ "$kak_opt_sublime_cursor_mode" == "single" ] && [ ${#kak_selection} == 1 ]; then
    printf ": set-option buffer sublime_cursor_mode multi<ret>";

    # if we are going to select whitespace
    if [ -z "${kak_reg_dot// }" ]; then
      printf %s '<a-i><space>';

    # if we are going to select an alphanumeric, select a word
    elif [[ "$kak_reg_dot" =~ [a-zA-Z0-9] ]]; then
      printf %s '<a-i>w*';

    # otherwise, select a WORD
    # see https://github.com/mawww/kakoune/blob/master/doc/pages/keys.asciidoc
    # for definitions of WORD v word
    else
      printf %s '<a-i><a-w>*';
    fi

  # we're in multi-cursor mode, but there might be a single selection b/c we
  # just did <a-i><a-w> in the previous branch. we might also be in single
  # cursor mode, and just have a word highlighted manually by the user. Set
  # mode to multi and search for the next instance of the selection
  elif [ "$kak_reg_hash" == 1 ]; then
    printf ": set-option buffer sublime_cursor_mode 'multi'<ret>";
    printf %s '*N';
  else
    printf %s 'N';
  fi
}}

# TODO(enricozb)this has changed b/c of ModeChange
# hook global InsertEnd sublime-single-check %{ evaluate-commands %sh{
#   echo "fail what is happening";
#   if [ "$kak_reg_hash" == 1 ]; then
#     echo 'set-option buffer sublime_cursor_mode "single"<ret>'
#   fi
# }}

# undo <c-d> selection
map global normal <c-u> <a-space>

# remove multiple selections
map global normal <esc> ': set-option buffer sublime_cursor_mode "single"<ret><space>'
