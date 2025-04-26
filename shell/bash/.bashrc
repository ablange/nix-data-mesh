# Custom PS1 Terminal Prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)"); PS1_CMD2=$()'; PS1='\[\e[34m\][\u\[\e[34m\]@\[\e[34m\]\h\[\e[34m\]]\[\e[0m\] \[\e[96m\](\[\e[96m\]\w\[\e[96m\])\[\e[91m\]${PS1_CMD1}\[\e[0m\] \[\e[92m\](${PS1_CMD2})\n\[\e[0m\]\$ '
source ~/.bash_aliases

# Git
source ~/.git-prompt.sh
source ~/.git-completion.bash
export GIT_EDITOR=nano
