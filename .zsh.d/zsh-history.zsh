# ============================
# 履歴管理の設定
# ============================
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$ZDOTDIR/zsh_history"
setopt inc_append_history  # コマンド実行ごとに即時履歴保存
setopt share_history  # 複数の zsh で履歴を共有
setopt hist_ignore_all_dups  # 重複履歴を削除
setopt hist_ignore_space  # スペースで始まるコマンドは履歴に保存しない