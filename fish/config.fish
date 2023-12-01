
function fish_greeting
    echo ~~ Hello Sweetie ~~
    echo Tellng you what time it is would be revealing ~~ spoilers ~~
end


eval (opam env)
setsid wal -i ~/Images/bg.png 2> /dev/null
fish_ssh_agent
ssh-add /home/charlotte/.ssh/id_github
ssh-add /home/charlotte/.ssh/id_gitlab_istic
ssh-add /home/charlotte/.ssh/id_rennes
set TYPST /home/charlotte/.local/lib/typst
set TYPST_FONT_PATH /home/charlotte/.local/share/fonts
starship init fish | source
alias ls="eza -l --icons=always --group-directories-first --hyperlink --git --git-repos-no-status"

# pnpm
set -gx PNPM_HOME "/home/charlotte/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
