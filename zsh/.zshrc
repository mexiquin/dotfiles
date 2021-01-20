# Created by newuser for 5.8
#
eval "$(starship init zsh)"

## case-insensitive (uppercase from lowercase) completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Show off that arch flair :)
neofetch
