# Dotfiles - Zsh & Doom Emacs 設定

このリポジトリは、Zsh と Doom Emacs の設定ファイルを管理するためのものです。  
複数の環境で同じ設定を適用するために、設定ファイルを一元管理しています。

## 📂 ディレクトリ構成
```bash
dotfiles/
├── .zshrc             # Zsh のメイン設定ファイル（ZDOTDIR に設定を分離）
├── .zsh.d/            # Zsh の詳細設定ディレクトリ
│   ├── env.zsh        # 環境変数の設定
│   ├── aliases.zsh    # エイリアスの設定
│   ├── prompt.zsh     # プロンプトの設定
│   ├── history.zsh    # ヒストリーの設定
│   ├── plugins.zsh    # プラグインの設定（fzf, zsh-autosuggestions など）
│   ├── completion.zsh # コマンド補完の設定
│   ├── keybindings.zsh # キーバインドのカスタマイズ
│   └── functions.zsh  # カスタム関数の定義
├── .doom.d/           # Doom Emacs の設定ディレクトリ
│   ├── config.el      # ユーザー設定（キーバインド・UI など）
│   ├── init.el        # 有効化する Doom Emacs モジュール
│   ├── packages.el    # 追加パッケージの管理
│   └── README.org     # Doom Emacs 設定の説明
└── README.md          # このリポジトリの説明
```

## 🛠 インストール手順

### 1. Dotfiles のクローン
まず、このリポジトリを `~/.dotfiles` にクローンします。

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
```


### 2. シンボリックリンクの作成
ホームディレクトリに設定ファイルへのシンボリックリンクを作成します。
```bash
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.zsh.d ~/.zsh.d
ln -sf ~/.dotfiles/.doom.d ~/.doom.d
```

### 3. Zsh の設定を反映
```bash
exec zsh
```

または、手動で設定をリロードする場合：
```bash
source ~/.zshrc
```

### 4. Doom Emacs のセットアップ
```bash
~/.config/emacs/bin/doom sync
```

## 主要な機能
### Zsh 設定
- 環境変数・パス管理 (env.zsh)
- プロンプトカスタマイズ (prompt.zsh) - Git ブランチ情報を表示
- 便利なエイリアス (aliases.zsh) - ll, gco, gst など
- 履歴の管理強化 (history.zsh) - Zsh の履歴を効率的に保存
- 補完機能の強化 (completion.zsh) - compinit を最適化
- プラグインの統合 (plugins.zsh)
- zsh-autosuggestions
- zsh-syntax-highlighting
- fzf (Ctrl+R で履歴検索)
