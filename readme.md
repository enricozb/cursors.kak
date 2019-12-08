# kak-cursors

Sublime multiple cursor behavior for kakoune. Please don't use this, and learn
the proper way to use Kakoune's multiple cursors. This is mainly for me who is
too lazy to learn to use **%s** or **xs**.

## Keybindings
- **ctrl-d** If cursor is on an alphanumeric character, select until
  non-alphanumeric characters. If cursor is on a non-alphanumeric character,
  select until whitespace. If cursor is on whitespace, select until a
  non-whitespace character. This also modifies the selection register `/`,
  and pressing it in succession will start selecting other instances of this
  selection.
- **ctrl-u** Remove last multiple selection. This can be achieved by default
  in Kakoune with **alt-space**.
- **n** Skip current selection. This is not a special keybinding, this is
  default Kakoune behavior.
- **ctrl-e** switch between single and multi cursor modes. See below for an
  explanation of why this is useful.
- **escape** in normal mode, this removes all of the multiple selections.

## How it Works
There are two possible states for this plugin to be in, single or multi
selection. In single mode, pressing **ctrl-d** will cause the selection
to widen accordingly. Now the plugin will be in multi mode. In multi mode,
pressing **ctrl-d** now starts creating multiple cursors as opposed to widening
the selection. **ctrl-e** switches between single/multi modes. This is useful
when you want to do multiple cursor selection without widening the selection
first. For example, let's say you want to change the plus symbols to minus.
```python
a = (1+2) - (2+3)
```
If you press **ctrl-d** when on the +, it will highlight the entire
parenthesized expression, since the cursor started on a non-alphanumeric
character. What you can do instead is **ctrl-e**, followed by **ctrl-d** over
the plus symbols to highlight exactly what is under the cursor and not select
anything more.

## To Do
See [todo](todo.md).

