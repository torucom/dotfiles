# ==============================
# Zsh 設定ファイル (~/.zshrc)
# ==============================

# Zsh の設定ディレクトリ
export ZDOTDIR="$HOME/.zsh.d"

# 共通設定ファイルをロード
for file in "$ZDOTDIR"/*.zsh; do
  [ -r "$file" ] && source "$file"
done