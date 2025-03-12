# ============================
# Zsh プラグインの読み込み (plugins.zsh)
# ============================

# 🔹 `zsh-autosuggestions` (履歴ベースの入力補完)
if command -v zsh-autosuggestions > /dev/null; then
    source $(dirname $(command -v zsh-autosuggestions))/../share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# 🔹 `zsh-syntax-highlighting` (コマンドの構文を色付け)
if command -v zsh-syntax-highlighting > /dev/null; then
    source $(dirname $(command -v zsh-syntax-highlighting))/../share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# 🔹 `fzf` (高速ファイル検索)
if command -v fzf > /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
    bindkey '^R' fzf-history-widget  # `Ctrl + R` で履歴検索
fi

# 🔹 `z` (最近使ったディレクトリへ爆速移動)
if command -v zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
elif [ -f /usr/share/z/z.sh ]; then
    . /usr/share/z/z.sh
elif [ -f /etc/profile.d/z.sh ]; then
    . /etc/profile.d/z.sh
fi