# .zshrc

source $HOME/.zsh.d/init.sh

# ローカル用設定ファイルの読み込み
if [ -f ~/.zsh_local ]; then
  . ~/.zsh_local
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
eval "$(direnv hook zsh)"

export PATH="$PATH:$HOME/google-cloud-sdk/bin"
export PATH="$HOME/.tfenv/bin:$PATH"
