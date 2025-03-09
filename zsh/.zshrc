HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/khald0r/.zshrc'

autoload -Uz compinit
compinit

alias cd=z
alias ls='eza --icons=always'
alias grep='grep --color=auto'
alias nv=nvim
alias vi=nvim
alias open=xdg-open
alias lg="lazygit"
alias code="code-insiders"

eval "$(zoxide init zsh)"

eval "$(fzf --zsh)"

eval "$(thefuck --alias)"

# Starship for an awesome prompt
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^X' autosuggest-execute

# Run neofetch if not in integrated terminal
if [ -z "$NVIM" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
    macchina
fi

# Set up yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH=$PATH:/home/khald0r/.spicetify
