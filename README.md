# README

## アプリ名
  medishar[メディシェア]<br>
  medicalsharing

## 概 要
   個人間で医療情報を共有できます。ターゲットは資格取得後の医療従事者とベテラン医療従事者の【学びたい】、【教えたい】という気持ちを結ぶAPPです。  
   初学者は【教えて欲しい内容】を投稿することで他者から返信を募集することが出来ます。ベテラン医療従事者は初学者へ知識や技術を提供できます。
   投稿者はお礼金を設定出来ますが、セキュリティの観点から直接、返信者と調整のうえ受け渡しをしてください。
   投稿に対する返信をすることでチャットボタンが出現します。
   チャットは投稿者と返信者のみが投稿・閲覧できます。

## トップページ
   ![top-page](https://user-images.githubusercontent.com/74485639/115525231-dd4efe80-a2c9-11eb-827b-a20c767e890f.jpg)
## 投稿ページ
   <img width="1352" alt="投稿ページ" src="https://user-images.githubusercontent.com/74485639/115818700-4785b180-a438-11eb-9437-192709c9fcef.png">


   チャット機能
   https://user-images.githubusercontent.com/74485639/115661205-0c23ae00-a378-11eb-95b4-c4c6d630e51f.mp4


## 本番環境
   URL  http://3.21.110.159/

   basic認証       ID : admin      PS : 0000

   テストアカウント  ID : test1@com  PS : test1111

## 利用方法
   *初学者は学びたい内容を投稿できます。経験者から返事が来るのを待ちます。  
   *経験者は学びたい内容を投稿に対して返信（投稿）できます。  
   *返信することで、チャット機能を使用できるようになります。 


## 製作背景（意図）
   医療経験の浅い人が自身の学びたい事について教えてくれる人を探すためにアプリを作成
   医療が高度化・複雑化していく中で学ばなければならない事が多くあります。しかしながら自身の周辺に学びたい内容について教えれる人がいない事が多々あります。最初に従事した職場の仕事範囲外は学ぶのが難しい医療業界で新たなキャリア形成をできるようにしたいと思い作成しました。

## 目指した課題解決
   医療従事者の「教えて欲しい」や「学びたい」という思いを解決します。教えて欲しい内容などを投稿することによって投稿内容の経験者を募り、投稿へ返信やチャット機能を使って出会いの機会を作ります。

## 使用技術（開発環境）
   Ruby 2.6.5
   Ruby on Rails 6.0.0
   VScode
   HTML, JavaScript, CSS
   GitHub
   AWS EC2




# テーブル設計

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
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages


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
- has_many :relearns, dependent: :destroy
- has_one_attached :image
- has_many :rooms, dependent: :destroy


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
| learn         | references | null: false,foreign_key: true |教えて投稿
| user          | references | null: false,foreign_key: true |投稿者

### Association
- belongs_to :user
- belongs_to :learn
- belongs_to :area
- belongs_to :gender
- belongs_to :job
- belongs_to :learn_num
- belongs_to :prefecture




## room_users テーブル(未実装)

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :room, optional: true
- belongs_to :user, optional: true


## rooms テーブル(未実装)

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- belongs_to :learn
- has_many :room_users, dependent: :destroy
- has_many :users, through: :room_users
- has_many :messages, dependent: :destroy


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user
- has_one_attached :image



