# README
<option value=<%= user.id %>><%= user.nickname %></option>

<select name="room[user_ids][]">
          <option value="">チャットするユーザーを選択してください</option>
          <%# User.where.not(id: current_user.id).each do |user| %>
            <option value=<%= user.id %>><%= Learn.find(params[:learn_id]).user.nickname %></option>
          <%# end %>
        </select>

        
## app name
  medishar[メディシェア]<br>
  medicalsharing

## app info
   個人間で医療情報を共有できます。ターゲットは資格取得後の医療従事者とベテラン医療従事者の【学びたい】、【教えたい】という気持ちを結ぶAPPです。  
   初学者は【教えて欲しい内容】を投稿することで他者から返信を募集することが出来ます。ベテラン医療従事者は初学者へ知識や技術を提供できます。
   投稿者はお礼金を設定出来ますが、セキュリティの観点から直接、返信者と調整のうえ受け渡しをしてください。
   投稿に対する返信をすることでチャットボタンが出現します。
   チャットは投稿者と返信者のみが投稿・閲覧できます。

   ![top-page](https://user-images.githubusercontent.com/74485639/115525231-dd4efe80-a2c9-11eb-827b-a20c767e890f.jpg)


## URL
   http://3.21.110.159/

## TestAccount
   ID : test1@com        PS : test1111

## basic認証
   ID : admin  PS : 0000

## 利用方法
   *初学者は学びたい内容を投稿できます。経験者から返事が来るのを待ちます。  
   *経験者は教えたい内容を投稿できます。投稿を見た初学者から教育の依頼が来るのを待ちます。  
   *初学者および経験者は既存の投稿により教育を依頼（受託）できます。  

## 目指した課題解決
   経験浅い医療職員の「教えて欲しい」や「学びたい」という思いを解決します。教えて欲しい内容や地域等を投稿することによって投稿内容の経験者を募り、出会いの機会を提供します。




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



