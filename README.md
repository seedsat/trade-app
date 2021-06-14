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