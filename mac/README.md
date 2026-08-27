# 新しいMacでの開発環境構築手順

## 手順

### 1. トラックパッドの設定変更

- 設定→トラックパッド→タップでクリックにチェック。

### 2. トラックボールの設定

- [ドライバをインストール](https://customer.kensington.com/ja/jp/s/64325/expert_mouse__wired_trackball#sw)

### 3. ターミナルの背景色変更＆メタキー設定

- ターミナル→環境設定→プロファイルでProを選択して、デフォルトをクリック。
- 「メタキーとしてOptionキーを使用」にチェックを入れる。

![ターミナルの設定](https://www.muratayusuke.com/assets/20161215/terminal.png)

### 4. 修飾キー等の変更

- 設定→キーボード→キーボードショートカット→修飾キーから変更。
- 設定→キーボード→入力ソース→「スペースバーを２回押してピリオドを入力」のチェックを外す。
- 設定→キーボード→入力ソース→日本語→「ライブ変換」と「タイプミスを修正」のチェックを外す。
  
![修飾キーの設定](https://www.muratayusuke.com/assets/mac_setting_001.png)

### 5. ショートカット設定

- 設定→キーボード→ショートカット→入力ソースの内容を無効化
  - Ctrl+Spaceはemacsでめっちゃ使う
- 設定→キーボード→ショートカット→Mission Controlの^↑と^↓を外す
  - Ctrl+上下のキーもわりとemacsで使う
- 設定→キーボード→ショートカット→キーボード→次のウィンドウを操作対象にする のショートカットをOption+Tabにする([参考](http://qiita.com/Yinaura/items/10fe5fe0cb0a795a0f58))
- Spotlightの「Spotlight検索を表示」をcmd+option+Spaceに変更
  - cmd+Spaceはalfredに割り当てたい

### 6. ホットコーナーの設定

- 設定→デスクトップとDock→ホットコーナーから、左下に「Mission Control」、右下に「アプリケーションウィンドウ」を割り当てます。

### 7. homebrewのインストール

各種アプリのインストールをhomebrew経由でやるので、ここでインストールしておきます。

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### 8. 各種アプリのインストール

インストール自動化スクリプトを[github](https://github.com/muratayusuke/dotfiles/blob/master/mac/setup.sh)に上げてるので、持ってきて実行します。

```
$ curl -sSL https://raw.githubusercontent.com/muratayusuke/dotfiles/master/mac/setup.sh | bash
```

### 9. インストールした主要アプリの設定

1つずつ起動して設定していく。

- Google Chrome
- Dropbox
- Google Drive
- Alfred 4
- [AWSCLI](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)

### 10. 個別インストールが必要なものを入れる

`.pkg` インストーラと Mac App Store（`mas`）は sudo が必要なので `setup.sh` には入れない。手順8のあと、自分のターミナルで実行する。

```
$ sudo softwareupdate --install-rosetta
$ brew install --cask zoom
$ brew install --cask microsoft-teams
$ brew install --cask google-japanese-ime
$ brew install --cask google-drive
$ brew install mas
$ mas get 803453959  # slack
$ mas get 302584613  # kindle
```

- Karabiner-Elements: 左Commandタップで英語（ABC）、右CommandタップでGoogle日本語入力に切り替える
  - インストール: `brew install --cask karabiner-elements`
  - システム設定 → キーボード → テキスト入力 → 編集 で、入力ソースに「ABC」と「Google日本語入力」を追加する（Google日本語入力は上で入れる）
  - Karabiner-Elements → Complex Modifications → Add your own rule に以下を追加する
  - Commandは単独タップで切り替わる。他キーと同時押ししたときは普通のCommandとして働く
  - 英語キーボードが US の場合は `ABC` を `US` に変える。実際の ID は EventViewer → Variables で確認できる

```json
{
    "description": "Left Cmd -> ABC English, Right Cmd -> Google Japanese",
    "manipulators": [
        {
            "from": {
                "key_code": "left_command",
                "modifiers": { "optional": ["any"] }
            },
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 300,
                "basic.to_if_held_down_threshold_milliseconds": 100
            },
            "to": [{ "key_code": "left_command", "lazy": true }],
            "to_if_alone": [
                { "select_input_source": { "input_source_id": "^com\\.apple\\.keylayout\\.ABC$" } }
            ],
            "to_if_held_down": [{ "key_code": "left_command" }],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "right_command",
                "modifiers": { "optional": ["any"] }
            },
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 300,
                "basic.to_if_held_down_threshold_milliseconds": 100
            },
            "to": [{ "key_code": "right_command", "lazy": true }],
            "to_if_alone": [
                {
                    "select_input_source": {
                        "input_source_id": "^com\\.google\\.inputmethod\\.Japanese\\.base$",
                        "input_mode_id": "^com\\.apple\\.inputmethod\\.Japanese$"
                    }
                }
            ],
            "to_if_held_down": [{ "key_code": "right_command" }],
            "type": "basic"
        }
    ]
}
```

- Docker form mac: https://docs.docker.com/desktop/mac/install/

### 11. ログイン項目設定

起動時に自動で開いておいて欲しいアプリを設定します。設定→ユーザーとグループ→ログイン項目から。追加するのは下記のアプリ。

- [Dropbox](https://www.dropbox.com/) : 言わずとしれたファイル共有サービス
- [Clipy](https://clipy.softonic.jp/mac): クリップボードを一定数保存しておけるアプリ
- Docker
- Alfred 4
- Google Drive

### 12. dotfile系を持ってくる

得意の[homesick](/2013/01/11/%E8%A4%87%E6%95%B0pc%E9%96%93%E3%81%A7%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E5%90%8C%E6%9C%9F%E3%81%A7%E3%81%8D%E3%82%8Bhomesick%E3%81%8C%E4%BE%BF%E5%88%A9/)で設定ファイルを持ってきます。ついでにシェルをzshに変更。

```
$ gem install homesick
$ homesick clone git@github.com:muratayusuke/dotfiles.git
$ homesick symlink
$ chsh -s /bin/zsh
```

tmux のセッション復元（resurrect + continuum）は手順8の `setup.sh` でプラグインを clone 済み。
homesick symlink 後に `.tmux.conf` が有効になり、起動時の自動復元が使える。

確認（任意）:

```
$ ls ~/.tmux/plugins
$ tmux source-file ~/.tmux.conf
```

使い方:
- 手動保存: `Ctrl-x` → `Ctrl-s`
- 手動復元: `Ctrl-x` → `Ctrl-r`
- 15分ごとに自動保存、tmux 起動時に自動復元

### 13. VS Codeのセッティングを復元
- https://code.visualstudio.com/docs/editor/settings-sync

### 14. Misson Controlの設定

- 設定→デスクトップとDock→MIssion Controleから「最新の使用状況に基づいて操作スペースを自動的に並べ替える」のチェックを外します（いらんことすんな）。
- 設定→デスクトップとDock→MIssion Controleから「ディスプレイごとの個別の操作スペース」のチェックを外します。反映にはログアウトが必要なので再起動します。
- 3本指上スワイプでMission Controlを開き、ディスプレイを3枚追加して計4枚にする
- 設定→キーボード→ショートカット→Mission Controlで以下を設定
  - デスクトップ1へ切り替え: Option + A
  - デスクトップ2へ切り替え: Option + S
  - デスクトップ3へ切り替え: Option + Z
  - デスクトップ4へ切り替え: Option + X

### 15. ビデオ会議ツール系の設定

- chrome, slack, zoom, teamsそれぞれで画面共有を試し、許可をしておく
