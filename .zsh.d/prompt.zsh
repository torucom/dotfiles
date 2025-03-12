# ============================
# Zsh プロンプト（短縮ディレクトリ + Git ブランチ）
# ============================

autoload -Uz vcs_info

# カレントディレクトリを短縮して表示
short_pwd() {
  local path="${PWD}"
  if [[ "$path" == "$HOME" ]]; then
    echo "~"
    return
  fi

  local IFS='/'
  local path_array=(${(s:/:)path})
  local short_path=""

  if [[ "${#path_array[@]}" -eq 1 ]]; then
    echo "/"
    return
  fi

  short_path="${(L)path_array[1]:0:1}/"
  for (( i=2; i<${#path_array[@]}-1; i++ )); do
    short_path+="${(L)path_array[i]:0:1}/"
  done

  short_path+="${path_array[-1]}"
  echo "$short_path"
}

precmd() {
    vcs_info
    local short_dir="$(short_pwd)"
    if [[ -n "$vcs_info_msg_0_" ]]; then
        local git_branch="󰊢 %F{green}${vcs_info_msg_0_}%f"
    else
        local git_branch=""
    fi
    export PROMPT="%F{yellow}${short_dir}%f ${git_branch} %F{cyan}❯%f "
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'