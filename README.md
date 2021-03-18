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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

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
