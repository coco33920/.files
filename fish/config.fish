
function fish_greeting
    echo ~~ Hello Sweetie ~~
    echo Tellng you what time it is would be revealing ~~ spoilers ~~
end


eval (opam env)
setsid wal -i ~/Images/bg.png 2> /dev/null
fish_ssh_agent
ssh-add /home/charlotte/.ssh/id_github
ssh-add /home/charlotte/.ssh/id_gitlab_istic
ssh-add /home/charlotte/.ssh/id_gitlab_inria
ssh-add /home/charlotte/.ssh/id_rennes
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/charlotte/.ghcup/bin # ghcup-env
set TYPST /home/charlotte/.local/lib/typst
starship init fish | source
alias ls="eza -l --icons=always --group-directories-first --hyperlink --git --git-repos-no-status"
