# TwiCode
TwiCodeは、Twitterでちょっとしたソースコードを共有したい人のためのソースコード画像作成サービスです。

TwiCodeでコードを入力すると、ソースコード画像とURLを生成します。URLをツイートすることでTwitterカードに画像を表示します。

従来のようにコードをテキストで投稿するよりも読みやすく、画像で投稿する時と違ってURLからコードがコピーできることが特徴です。

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
