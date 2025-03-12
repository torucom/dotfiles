# ============================
# `fzf`（履歴検索を爆速化）
# ============================
if command -v fzf > /dev/null; then
    export FZF_DEFAULT_COMMAND='find . -type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
    bindkey '^R' fzf-history-widget  # `Ctrl + R` で履歴検索
fi