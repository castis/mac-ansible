local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

PROMPT="
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%})\
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${git_info}\
 \
$exit_code
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
