HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/khald0r/.zshrc'
zstyle ':completion:*' menu select

export LS_COLORS="$(vivid generate molokai)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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
alias la="ls -la"

eval "$(zoxide init zsh)"

eval "$(fzf --zsh)"

# Starship for an awesome prompt
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^X' autosuggest-execute

# Run neofetch if not in integrated terminal or tmux
if [ -z "$NVIM" ] && [ "$TERM_PROGRAM" != "vscode" ] && [ -z "$TMUX" ]; then
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

eval $(thefuck --alias)
