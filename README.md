# TwiCode
TwiCodeは、Twitterでちょっとしたソースコードを共有したい人のためのソースコード画像作成サービスです。

TwiCodeでコードを入力すると、ソースコード画像とURLを生成します。URLをツイートすることでTwitterカードに画像を表示します。

従来のようにコードをテキストで投稿するよりも読みやすく、画像で投稿する時と違ってURLからコードがコピーできることが特徴です。

<div align="center">
  <img src="https://user-images.githubusercontent.com/67262644/148015127-48d46044-49d2-4b13-b440-db12cd5a2322.png" width="300px">
  <p>https://twitter.com/yana_gis/status/1473838056847581189</p>
</div>

## 開発環境
- Ruby 3.0.2
- Rails 6.1.4

## 機能概要
- Twitterアカウントでのみログインが可能です。
- 新規作成画面からコードを入力し画像を生成すると、コードを表示するURLに遷移します。
- TwitterにURLを投稿すると、Twitterカードとして画像を表示することができます。
- ユーザーごとに投稿したコードの一覧を参照できます。

## 利用方法

### 環境変数の設定
| 環境変数名 | 説明 |
| :--- | :--- |
| TWITTER_API_KEY | Twitter API key  |
| TWITTER_API_SECRET | Twitter API key secret |

### インストール
```
$ bin/setup
$ rails server
```

### テスト・Lint
```
$ ./bin/lint
$ bundle exec rspec
```

## ScreenShots
<img src="https://user-images.githubusercontent.com/67262644/148013619-00fb9b53-1704-4aca-9724-b0732bf7d4bb.png" width="280px"><img src="https://user-images.githubusercontent.com/67262644/148013575-6e490160-8cdd-47aa-a712-1a2cfc5d3a73.png" width="290px"><img src="https://user-images.githubusercontent.com/67262644/148013743-f66d33ba-23f5-46e8-b987-6bc1985953fc.png" width="300px"><img src="https://user-images.githubusercontent.com/67262644/148015692-c8a0f0ba-1c19-4d8b-97b0-2c4ebe59b8fc.png" width="300px">

