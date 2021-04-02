# README

## app name
   medishar[メディシェア]   medicalsharing

## app info
   個人間で医療情報を共有できます。ターゲットは資格取得後の医療従事者とベテラン医療従事者の【学びたい】、【教えたい】を結ぶAPPです。
   初学者は比較的定額にてベテランから教えを受けることができます。ベテラン医療従事者はお小遣い稼ぎで知識や技術を提供できます。どちらにもメリットはあります。

## URL
   未定

## TestAccount
   ID :        PS :

## basic認証
   ID : admin  PS : 0000

## 利用方法
   *初学者は学びたい内容を投稿できます。経験者から返事が来るのを待ちます。
   *経験者は教えたい内容を投稿できます。投稿を見た初学者から教育の依頼が来るのを待ちます。
   *初学者および経験者は既存の投稿により教育を依頼（受託）できます。

## 目指した課題解決
   経験浅い医療職員の「教えて欲しい」や「学びたい」という思いを解決します。教えて欲しい内容や地域等を投稿することによって投稿内容の経験者を募り、出会いの機会を提供します。




# テーブル設計（まだ未設計です）

## users テーブル

| Column     | Type   | Options                    |
| --------   | ------ | -------------------------- |
| nickname   | string | null: false                |
| first_name | string | null: false                |
| last_name  | string | null: false                |
| first_kana | string | null: false                |
| last_kana  | string | null: false                |
| birthday   | date   | null: false                |
| email      | string | null: false, unique: true  |
| password   | string | null: false                |

### Association
- has_many :relearns
- has_many :learns


## room_users テーブル(未実装)

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## rooms テーブル(未実装)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users



## learns テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| job_id        | integer    | null: false                   |職種
| gender_id     | integer    | null: false                   |性別
| studytitle    | string     | null: false                   |学びたい内容のタイトル
| study         | text       | null: false                   |学びたい内容
| prefecture_id | integer    | null: false                   |都道府県
| area_id       | integer    | null: false                   |場所を提供する側
| area_provided | text       |                               |場所の詳細など
| thankyou_money| integer    |                               |お礼金
| learn_num_id  | integer    | null: false                   |学びたい側の人数
| condition     | text       |                               |条件
| user          | references | null: false,foreign_key: true |投稿者

### Association
- belongs_to :user
- has_many :relearns

## relearns テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| job_id        | integer    | null: false                   |職種
| gender_id     | integer    | null: false                   |性別
| restudytitle  | string     | null: false                   |re教えて内容のタイトル
| restudy       | text       | null: false                   |re教えたい内容
| prefecture_id | integer    | null: false                   |都道府県
| area_id       | integer    | null: false                   |場所を提供する側
| area_provided | text       |                               |場所の詳細など
| learn_num_id  | integer    | null: false                   |教えたい側の人数
| condition     | text       |                               |条件
|               |            |                               |
| learn         | references | null: false,foreign_key: true |教えて投稿
| user          | references | null: false,foreign_key: true |投稿者

### Association
- belongs_to :user



## teach テーブル(案を入力済み！！)(未実装)

| Column        | Type       | Options                    |
| ------------- | ---------- | -------------------------- |
| job_id        | integer    | null: false                |職種
| gender_id     | integer    | null: false                |性別
| lecture       | text       | null: false                |教えたい内容
| prefecture_id | integer    | null: false                |都道府県
| area_id       | integer    | null: false                |場所を提供する側
| area_provided | text       | null: false                |場所の詳細など
| lecture_money | integer    | null: false                |講義の依頼金額
| teach_num_id  | integer    | null: false                |教える側の人数
| condition     | text       | null: false                |条件

### Association






- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# README

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_kana         | string     | null: false                    |
| last_kana          | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :orders




## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |商品名
| description       | text       | null: false                    |説明
| category_id       | integer    | null: false                    |分類   (ActiveHash)
| state_id          | integer    | null: false                    |状態   (ActiveHash)
| delivery_fee_id   | integer    | null: false                    |手数料 (ActiveHash)
| prefecture_id     | integer    | null: false                    |発送地 (ActiveHash)
| day_id            | integer    | null: false                    |      (ActiveHash)
| price             | integer    | null: false                    |値段
| user              | references | null: false,foreign_key: true  |出品者

### Association
- belongs_to :user
- has_one :order




## Ordersテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |購入者
| item              | references | null: false, foreign_key: true |購入品

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Addressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |郵便番号
| prefecture_id     | integer    | null: false                    |都道府県(ActiveHash)
| city              | string     | null: false                    |市町村
| address           | string     | null: false                    |番地
| building_name     | string     |                                |建物名
| telephone         | string     | null: false,                   |電話番号
| order             | references | null: false, foreign_key: true |

### Association
- belongs_to :order
