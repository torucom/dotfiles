# ============================
# 補完の設定
# ============================
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select  # `TAB` で選択式補完を有効化
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
setopt completealiases  # エイリアスの補完を有効化