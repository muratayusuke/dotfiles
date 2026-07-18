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

# bun completions
[ -s "/Users/muratayusuke/.bun/_bun" ] && source "/Users/muratayusuke/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/muratayusuke/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/muratayusuke/.dart-cli-completion/zsh-config.zsh ]] && . /Users/muratayusuke/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Added by Windsurf
export PATH="/Users/muratayusuke/.codeium/windsurf/bin:$PATH"
alias claude="/Users/muratayusuke/.claude/local/claude"
alias puma-restart="docker compose exec web bin/rails restart"
# Puma再起動用エイリアス
alias pr="docker compose exec web pkill -USR2 -f puma && echo \"Puma再起動シグナル送信完了\""

# Go環境変数の設定
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Added by Antigravity
export PATH="/Users/muratayusuke/.antigravity/antigravity/bin:$PATH"

# claude code
alias cc='claude --dangerously-skip-permissions'
