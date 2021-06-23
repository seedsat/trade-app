# TRADE APP

## 概要
アイドルグループの生写真トレードサイト。<br>
現段階では坂道3グループのみに対応しています。<br>
会員登録を終えたユーザがトレードを希望出来て、コメントしてきたユーザーの中からトレードしてもいいユーザーがいれば取引するボタンを押して取引成立です。


## URL
https://trade-app-35823.herokuapp.com/



## 利用方法
会員登録をせずともトレード希望を出されている物は全て見れます。
トレードをしたいユーザーは会員登録が必須になります。


## 目指した課題解決
アイドルグッズの中で生写真の需要はかなり高いです。<br>
生写真のトレードはイベント会場で行うのが普通ですが、<br>
このコロナ禍でイベントがなくなりトレードを行える場所がなくなりました。<br>
そこで、イベントがなくてもトレードを行える場所を提供しようと思い作成しました。<br>
また、都市部に住んでいない地方在住者にも気軽にトレードをしてもらいたく考えました。



## 実装した機能
- 会員登録
- 商品出品
- 商品編集
- 商品削除
- 商品一覧
- 商品詳細
- コメント
- 商品検索
- マイページ
- いいね
- ページネーション




# テーブル設計

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
- has_many :transactions
- has_many :comments
- has_many :likes

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
- has_one           :transactions
- has_many          :comments
- has_many          :likes
- has_many_attached :images

## transactionsテーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| picture   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture

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

- has_one :user

## Commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| picture   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture

## Likesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| user      | references | null: false, foreign_key: true |
| picture   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture