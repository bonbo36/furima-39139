# テーブル設計

## users テーブル

| Column          | Type   | Options     | 
| --------------- | ------ | ----------- | 
| nickname        | string | null: false | 
| email           | string | null: false | 
| password        | string | null: false | 
| first_name      | string | null: false | 
| last_name       | string | null: false | 
| first_name_kana | string | null: false | 
| last_name_kana  | string | null: false | 
| birthday        | date   | null: false | 

###### Association

- has_many :items
- has_many :purchase_record

## items テーブル

| Column                  | Type       | Options                       | 
| ----------------------- | -------    | ----------------------------  | 
| seller                  | string     | null: false                   | 
| item_name               | string     | null: false                   | 
| category                | text       | null: false                   | 
| status                  | text       | null: false                   | 
| shipping_charge         | text       | null: false                   | 
| delivery_area           | text       | null: false                   | 
| estimated_delivery_date | text       | null: false                   | 
| user_id                 | references | null: false, foreign_key:true | 

###### Association

- belongs_to :user
- has_one :purchase_record

## purchase_record テーブル

| Column   | Type       | Options                       | 
| -------- | ---------- | ----------------------------- | 
| buyer    | string     | null: false                   | 
| purchase | string     | null: false                   | 
| user_id  | references | null: false, foreign_key:true | 
| items_id | references | null: false, foreign_key:true | 

###### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_adress テーブル

| Column             | Type       | Options                       | 
| ------------------ | ---------- | ----------------------------- | 
| post_code          | string     | null: false                   | 
| prefectures        | string     | null: false                   | 
| municipality       | text       | null: false                   | 
| address            | text       | null: false                   | 
| building_name      | text       | null: false                   | 
| room_number        | integer    | null: false                   | 
| purchase_record_id | references | null: false, foreign_key:true | 

###### Association

- belongs_to :purchase_record

