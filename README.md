# TRADE APP

## 概要
アイドルグループの生写真トレードサイト。<br>
現段階では坂道3グループのみに対応しています。<br>
会員登録を終えたユーザがトレードを希望出来て、コメントしてきたユーザーの中からトレードしてもいいユーザーがいれば取引するボタンを押して取引成立です。
<br>
<br>
## URL
https://trade-app-35823.herokuapp.com/
<br>
<br>
## 利用方法
会員登録をせずともトレード希望を出されている物は全て見れます。<br>
トレードやコメントをしたいユーザーは会員登録が必須になります。
<br>
<br>
## 目指した課題解決
アイドルグッズの中で生写真の需要はかなり高くコレクションの要素も高いです。<br>
通常、生写真のトレードはイベント会場で行うのですが、<br>
このコロナ禍でイベントがなくなりトレードを行える場所がなくなりました。<br>
そこで、イベントがなくてもトレードを気軽に行える場所を提供しようと思い作成しました。<br>
また、都市部に住んでいない地方在住者にも気軽にトレードをしてもらいたく考えました。
<br>
<br>
## 洗い出した要件

- 会員登録
<br>

[![Image from Gyazo](https://i.gyazo.com/4baee4f769ef363c894eade02642d628.gif)](https://gyazo.com/4baee4f769ef363c894eade02642d628)

<br>
<br>

- 商品出品

[![Image from Gyazo](https://i.gyazo.com/93d620f1fba638ce44ab21d3c61a6923.gif)](https://gyazo.com/93d620f1fba638ce44ab21d3c61a6923)
<br>
<br>
- 商品編集

[![Image from Gyazo](https://i.gyazo.com/52d8b4a1c84bdf83767d20076d8bae2a.gif)](https://gyazo.com/52d8b4a1c84bdf83767d20076d8bae2a)
<br>
<br>
- 商品削除

[![Image from Gyazo](https://i.gyazo.com/af2ed7ef562986f2e0f293190db9d7c9.gif)](https://gyazo.com/af2ed7ef562986f2e0f293190db9d7c9)
<br>
<br>
- 商品一覧
- 商品詳細
- コメント

[![Image from Gyazo](https://i.gyazo.com/2249f468b6f3b481f5b6a91bb3fd1ae7.png)](https://gyazo.com/2249f468b6f3b481f5b6a91bb3fd1ae7)
<br>
<br>

- 商品検索

[![Image from Gyazo](https://i.gyazo.com/73cd568622d6af1acf4c2defee8c224e.gif)](https://gyazo.com/73cd568622d6af1acf4c2defee8c224e)

[![Image from Gyazo](https://i.gyazo.com/397e6756c41682959f473fc643e54707.gif)](https://gyazo.com/397e6756c41682959f473fc643e54707)
<br>
<br>

- マイページ

[![Image from Gyazo](https://i.gyazo.com/5990248da12edd98ddbea5d1a1c0f545.jpg)](https://gyazo.com/5990248da12edd98ddbea5d1a1c0f545)

<br>
<br>

- いいね

[![Image from Gyazo](https://i.gyazo.com/494bd2b661c36f8669fc5f3b2f8dba1c.gif)](https://gyazo.com/494bd2b661c36f8669fc5f3b2f8dba1c)

<br>
<br>

- ページネーション

[![Image from Gyazo](https://i.gyazo.com/088890758ba0e0156334587c87ea9850.gif)](https://gyazo.com/088890758ba0e0156334587c87ea9850)


<br>
<br>
<br>

# テーブル設計
<br>

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |

### Association

- has_many :pictures
- has_many :tradings
- has_many :comments
- has_many :likes
- has_one :address

<br>
<br>

## picturesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| group_id           | integer    | null: false                    |
| member_id          | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| position_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to        :user
- has_one           :trading
- has_many          :comments
- has_many          :likes
- has_many_attached :images

<br>
<br>

## tradingsテーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| picture   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture

<br>
<br>

## Addressesテーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

<br>
<br>

## Commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| picture   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture

<br>
<br>

## Likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| user      | references | null: false, foreign_key: true |
| picture   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture
