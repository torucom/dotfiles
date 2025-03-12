# ============================
# Zsh 関数（便利系の関数）
# ============================

# Git の現在のブランチを取得
function git_branch {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# Docker のログを表示（最新100行 + リアルタイム監視）
function docker_logs {
  if [ -z "$1" ]; then
    echo "使用方法: docker_logs <コンテナ名>"
    return 1
  fi
  docker logs -f --tail=100 "$1"
}

# Zsh の設定をリロード
function reload_zsh {
  source ~/.zshrc
  echo "✅ Zsh 設定をリロードしました"
}