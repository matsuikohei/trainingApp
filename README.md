# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| employee_number    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |

## Association

- has_many :training_comments
- has_many :test_comments
- has_many :training_users
- has_many :trainings, through: :training_users
- has_many :test_users
- has_many :tests, through: :test_users

## trainingsテーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| training_date        | date    | null: false |
| training_category_id | integer | null: false |
| content              | text    | null: false |
| trainer_id           | integer | null: false |

## Association

- has_many :training_comments
- has_many :training_users
- has_many :users, through: :training_users

## training_usersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| training | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :training

## training_commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| training | references | null: false, foreign_key: true |
| content  | text       | null: false                    |

## Association

- belongs_to :user
- belongs_to :training

## testsテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| test_date        | date    | null: false |
| test_category_id | integer | null: false |
| result           | integer | null: false |
| examiner_id      | integer | null: false |

## Association

- has_many :test_comments
- has_many :test_users
- has_many :users, through: :test_users

## test_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| test   | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :test

## test_commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| test    | references | null: false, foreign_key: true |
| content | text       | null: false                    |

## Association

- belongs_to :user
- belongs_to :test
