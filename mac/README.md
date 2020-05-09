# 新しいMacでの開発環境構築手順

## 手順

### 1. トラックパッドの設定変更

設定→トラックパッド→タップでクリックにチェック。

### 2. ターミナルの背景色変更＆メタキー設定

ターミナル→環境設定→プロファイルでProを選択して、デフォルトをクリック。

あとoptionキーをメタキーとして使いたいので、「メタキーとしてOptionキーを使用」にチェックを入れる。

![ターミナルの設定](https://www.muratayusuke.com/assets/20161215/terminal.png)

### 3. Xcodeのインストール

Mac App StoreからXcodeをインストール。とりあえず起動してライセンス承認しておく。確か後々development toolを使うためにこの順番にメモったような気がする。

### 4. 修飾キーの変更

設定→キーボード→修飾キーから変更。
  
![修飾キーの設定](https://www.muratayusuke.com/assets/mac_setting_001.png)

### 5. homebrewのインストール

各種アプリのインストールをhomebrew経由でやるので、ここでインストールしておきます。

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### 6. 各種アプリのインストール

インストール自動化スクリプトを[github](https://github.com/muratayusuke/dotfiles/blob/master/mac/setup.sh)に上げてるので、持ってきて実行します。

```
$ curl -sSL https://raw.githubusercontent.com/muratayusuke/dotfiles/master/mac/setup.sh | bash
```

### 7. Right Zoom/Totalspaces2のインストール

- Right Zoon: http://www.blazingtools.com/right_zoom_mac.html
- Totalspaces2: http://totalspaces.binaryage.com/

### 8. ログイン項目設定

起動時に自動で開いておいて欲しいアプリを設定します。設定→ユーザーとグループ→ログイン項目から。追加するのは下記のアプリ。

- [TotalSpaces2](http://totalspaces.binaryage.com/): 昔のOSXのSpacesを再現するアプリ
- [Dropbox](https://www.dropbox.com/) : 言わずとしれたファイル共有サービス
- [RightZoom](http://www.macupdate.com/app/mac/30591/right-zoom): Command + Option + Eで、Windowsの最大化っぽいことができるようになるアプリ
- [Clipy](https://clipy.softonic.jp/mac): クリップボードを一定数保存しておけるアプリ

### 9. ホットコーナーの設定

設定→Mission Control→ホットコーナーから、左下に「Mission Control」、右下に「アプリケーションウィンドウ」を割り当てます。

### 10. 「ディスプレイごとの個別の操作スペース」を外す

個人的にディスプレイつないでる時は全部一緒に画面切り替わって欲しいので、設定→MIssion Controleから「ディスプレイごとの個別の操作スペース」のチェックを外します。反映にはログアウトが必要ですが、次の手順で再起動するので問題なし。

### 11. SIPを無効にする

TotalSpaces2を動かすためと、root権限のファイルをいじるためにSIPをオフにしておきます。（要再起動）

※セキュリティは弱くなるのでどうしても必要でなければやらない方がいいです。

参考: [http://berukann.hatenablog.jp/entry/2015/12/30/123020](http://berukann.hatenablog.jp/entry/2015/12/30/123020)

### 12. dotfile系を持ってくる

得意の[homesick](/2013/01/11/%E8%A4%87%E6%95%B0pc%E9%96%93%E3%81%A7%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E5%90%8C%E6%9C%9F%E3%81%A7%E3%81%8D%E3%82%8Bhomesick%E3%81%8C%E4%BE%BF%E5%88%A9/)で設定ファイルを持ってきます。ついでにシェルをzshに変更。

```
$ gem install homesick
$ homesick clone git@github.com:muratayusuke/dotfiles.git
$ homesick symlink
$ chsh -s /bin/zsh
```

### 13. 英かなインストール

SierraからKarabinerが使えなくなっちゃったので、代わりに「[英かな](https://ei-kana.appspot.com/)」というアプリで左右のCommandキーをかな/英数に割り当てます。

ぶっちゃけMac Book ProではKarabinerのこの機能しか使ってなかったのでこれで十分でした。

HHKをつないでる会社のMac miniも最近Sierraに上げたので、そっちは真面目にキーマッピング設定する必要がありそうです。

### 14. TotalSpaces2の設定

あの縦横2マスずつの4画面が好きなので、そうなるように設定します。

### 15. ショートカット設定

- Ctrl+Spaceはemacsでめっちゃ使うので、設定→キーボード→ショートカット→入力ソースの内容を無効化
- Ctrl+上下のキーもわりとemacsで使うので、設定→キーボード→ショートカット→Mission Controlの^↑と^↓を外す
- 設定→キーボード→ショートカット→キーボード→次のウィンドウを操作対象にする のショートカットをOption+Tabにする([参考](http://qiita.com/Yinaura/items/10fe5fe0cb0a795a0f58))
