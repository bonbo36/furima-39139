# テーブル設計

## users テーブル

| Column                    | Type   | Options                   | 
| ------------------------- | ------ | ------------------------  | 
| nickname                  | string | null: false               | 
| email                     | string | null: false, unique: true | 
| encrypted_password        | string | null: false               | 
| first_name                | string | null: false               | 
| last_name                 | string | null: false               | 
| first_name_kana           | string | null: false               | 
| last_name_kana            | string | null: false               | 
| birthday                  | date   | null: false               | 

###### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                     | Type          | Options                       | 
| -------------------------- | ------------- | ----------------------------  | 
| item_name                  | string        | null: false                   | 
| category_id                | integer       | null: false                   | 
| status_id                  | integer       | null: false                   | 
| shipping_charge_id         | integer       | null: false                   | 
| delivery_area_id           | integer       | null: false                   | 
| estimated_delivery_date_id | integer       | null: false                   | 
| user_id                    | references    | null: false, foreign_key:true | 

###### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column  | Type       | Options                       | 
| ------- | ---------- | ----------------------------- | 
| user_id | references | null: false, foreign_key:true | 
| item_id | references | null: false, foreign_key:true | 

###### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options                       | 
| ------------------ | ---------- | ----------------------------- | 
| post_code          | string     | null: false                   | 
| delivery_area_id   | integer    | null: false                   | 
| municipality       | string     | null: false                   | 
| address            | string     | null: false                   | 
| building_name      | string     |                               | 
| room_number        | string     | null: false                   | 
| purchase_record_id | references | null: false, foreign_key:true | 

###### Association

- belongs_to :purchase_record

