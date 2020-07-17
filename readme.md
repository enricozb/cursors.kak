# kak-cursors

Sublime multiple cursor behavior for kakoune. Please don't use this, and learn
the proper way to use Kakoune's multiple cursors. This is mainly for me who is
too lazy to learn to use **%s**, **xs**, and **N**.

## Keybindings
- **<c-d>** If cursor is on an alphanumeric character or underscore/hyphen,
  select until non-alphanumeric characters. If cursor is on a non-alphanumeric
  character, select until whitespace. If cursor is on whitespace, select until
  a non-whitespace character. This modifies the `/` register.
- **<c-u>** Remove last multiple selection. This can be achieved by default
  in Kakoune with **<a-space>**.
- **n** Skip current selection. This is not a special keybinding, this is
  default Kakoune behavior.
- **<space>** in normal mode, this removes all of the multiple selections.

## To Do
See [todo](todo.md).

