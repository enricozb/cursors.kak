# cursors.kak

Sublime multiple cursor behavior for kakoune. Please don't use this, and learn
the proper way to use Kakoune's multiple cursors. This is mainly for me who is
too lazy to learn to use **%s**, **xs**, and **N**.

## Keybindings
- **&lt;c-d&gt;** If cursor is on an alphanumeric character or underscore/hyphen,
  select until non-alphanumeric characters. If cursor is on a non-alphanumeric
  character, select until whitespace. If cursor is on whitespace, select until
  a non-whitespace character. This modifies the `/` register.
- **&lt;c-u&gt;** Remove last multiple selection. This can be achieved by default
  in Kakoune with **&lt;a-space&gt;**.
- **&lt;c-e&gt;** Select the current character. Identical to `*N`.
- **n** Skip current selection. This is not a special keybinding, this is
  default Kakoune behavior.
- **&lt;space&gt;** in normal mode, this removes all of the multiple selections.

## todo
See [todo](todo.md).
