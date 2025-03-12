# ============================
# 環境変数 & パス設定
# ============================
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/torucom/.nvm/versions/node/v22.12.0/bin:$PATH"
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

# Node.js（nvm）の設定
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion"