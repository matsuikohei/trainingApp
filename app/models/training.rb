class Training < ApplicationRecord
  has_many :training_users, dependent: :destroy
  has_many :users, through: :training_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :training_category
  with_options presence: true do
    validates :training_date
    validates :training_category_id, numericality: { other_than: 1 }
    validates :content
    validates :trainer_id
  end
  validate :training_date_cannot_be_in_the_future, if: :training_date_valid?

  def training_date_valid?
    training_date != nil
  end

  def training_date_cannot_be_in_the_future
    errors.add(:training_date, "can't be in the future") if training_date > Date.today
  end
end
