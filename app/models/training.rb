class Training < ApplicationRecord
  has_many :training_users
  has_many :users, through: :training_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_training
end
