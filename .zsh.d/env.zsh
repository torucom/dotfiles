# ============================
# 環境変数 & パス設定
# ============================
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/torucom/.nvm/versions/node/v22.12.0/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export DOOMDIR="$HOME/.doom.d"

# Node.js（nvm）の設定
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion"