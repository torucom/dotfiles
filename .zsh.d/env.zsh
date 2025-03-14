# ============================
# 環境変数 & パス設定
# ============================
export PATH="/opt/homebrew/bin:$PATH"

# Node.js（nvm）の設定
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion"

# nvm のロードが終わってから Node.js の PATH を設定
if command -v nvm >/dev/null 2>&1; then
    export PATH="$HOME/.nvm/versions/node/$(nvm version)/bin:$PATH"
fi

export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export DOOMDIR="$HOME/.doom.d"
export PATH="$HOME/.config/emacs/bin:$PATH"

# ============================
# Emacs の起動設定（GUI / CUI の切り替え）
# ============================
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    alias emacs="emacs -nw"  # iTerm では CUI 版を使う
else
    alias emacs="open -a Emacs"  # それ以外（デスクトップなど）は GUI 版
fi