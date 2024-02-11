# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

if status is-interactive
end

if set -q INSIDE_EMACS
    set_emacs_colors
end

alias e="emacsclient -n "
alias ee="emacsclient -n -c "
