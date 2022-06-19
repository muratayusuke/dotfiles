# 新しいMacでの開発環境構築手順

## 手順

### 1. トラックパッドの設定変更

- 設定→トラックパッド→タップでクリックにチェック。

### 2. トラックボールの設定

- [ドライバをインストール](https://www.kensington.com/ja-jp/p/%E8%A3%BD%E5%93%81/%E3%82%B3%E3%83%B3%E3%83%88%E3%83%AD%E3%83%BC%E3%83%AB/%E3%83%88%E3%83%A9%E3%83%83%E3%82%AF%E3%83%9C%E3%83%BC%E3%83%AB/expert-mouse-wired-trackball/)

### 3. ターミナルの背景色変更＆メタキー設定

- ターミナル→環境設定→プロファイルでProを選択して、デフォルトをクリック。
- 「メタキーとしてOptionキーを使用」にチェックを入れる。

![ターミナルの設定](https://www.muratayusuke.com/assets/20161215/terminal.png)

### 4. 修飾キーの変更

- 設定→キーボード→修飾キーから変更。
  
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

- 設定→Mission Control→ホットコーナーから、左下に「Mission Control」、右下に「アプリケーションウィンドウ」を割り当てます。

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

- Right Zoon: http://www.blazingtools.com/right_zoom_mac.html
- 英かな: https://ei-kana.appspot.com/
- Docker form mac: https://docs.docker.com/desktop/mac/install/

### 11. ログイン項目設定

起動時に自動で開いておいて欲しいアプリを設定します。設定→ユーザーとグループ→ログイン項目から。追加するのは下記のアプリ。

- [Dropbox](https://www.dropbox.com/) : 言わずとしれたファイル共有サービス
- [RightZoom](http://www.macupdate.com/app/mac/30591/right-zoom): Command + Option + Eで、Windowsの最大化っぽいことができるようになるアプリ
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

### 13. VS Codeのセッティングを復元

- Setting Syncをインストール: https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync
- インストール完了画面からGithubでログインしてsyncするgistを選択
- 設定をダウンロード: Shift + Alt + D

### 14. Misson Controlの設定

- 設定→MIssion Controleから「最新の使用状況に基づいて操作スペースを自動的に並べ替える」のチェックを外します（いらんことすんな）。
- 設定→MIssion Controleから「ディスプレイごとの個別の操作スペース」のチェックを外します。反映にはログアウトが必要なので再起動します。
