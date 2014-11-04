# vim:ft=zsh ts=2 sw=2 sts=2

setopt promptsubst

autoload -U add-zsh-hook

PROMPT_SUCCESS_COLOR=$FG[117]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]

rbenv_version() {
# prinnt rbenv version (actually not used)
  rbenv version 2>/dev/null | awk '{print $1}'
}

pyenv_version() {
# Print pyenv version in use
  pyenv version 2>/dev/null | awk 'NR==1 {print $1}'
}

pgenv_version() {
# Print pgenv when is set. NONE otherwise
  [ ! -z $VER ] && echo $VER || echo "NONE"
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

# Left prompt: [pyenv]{pgenv} user@host:path ○/±
PROMPT='%F{green}[$(pyenv_version)]%F{blue}{$(pgenv_version)} %F{magenta}%n%F{white}@%F{yellow}%m%F{white}:%F{green}${PWD/#$HOME/~}%F{white} $(prompt_char) '

# Right prompt: {git repository status}[git repository info] ⌚ Weekday number month hour:minutes AM/PM
RPROMPT='%F{white}{$(git_prompt_status)%F{white}}%F{blue}$(git_prompt_info) %F{green}⌚ %D{%a%e %b %L:%M} %F{yellow}%D{%p}%f'

#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
# zsh git config
ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%F{blue}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}✭%{$reset_color%}"

#RPROMPT='%{$fg_bold[green]%}Pyenv:[$(pyenv_version)]%{$reset_color%} %{$fg_bold[blue]%}Pgenv:[$(pgenv_version)]%{$reset_color%} %{$fg_bold[red]%}Rbenv:[$(rbenv_version)]%{$reset_color%}'
