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

[![Image from Gyazo](https://i.gyazo.com/ac1054a8fda814361576e70bbe13ec1d.png)](https://gyazo.com/ac1054a8fda814361576e70bbe13ec1d)

<br>
<br>

- 商品出品

[![Image from Gyazo](https://i.gyazo.com/f70c85d59b416ae45257e2cc998ae149.png)](https://gyazo.com/f70c85d59b416ae45257e2cc998ae149)

[![Image from Gyazo](https://i.gyazo.com/e5833980133d5df553b464b6459bed65.png)](https://gyazo.com/e5833980133d5df553b464b6459bed65)
<br>
<br>

- 商品一覧
- 商品詳細
- コメント

[![Image from Gyazo](https://i.gyazo.com/8df0b220e48d9601b122ee2c7be31e09.png)](https://gyazo.com/8df0b220e48d9601b122ee2c7be31e09)
<br>
<br>

- 商品検索

[![Image from Gyazo](https://i.gyazo.com/3a1e7a752b39fb5e2e3dab73e95de141.png)](https://gyazo.com/3a1e7a752b39fb5e2e3dab73e95de141)
<br>
<br>

- マイページ

[![Image from Gyazo](https://i.gyazo.com/d8347a5986330753d6a68be7f911fcee.png)](https://gyazo.com/d8347a5986330753d6a68be7f911fcee)

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
