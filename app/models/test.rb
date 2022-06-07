class Test < ApplicationRecord
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :test_category

  with_options presence: true do
    validates :test_date
    validates :test_category_id, numericality: { other_than: 1 }
    validates :result, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :examiner_id
  end

  validate :test_date_cannot_be_in_the_future, if: :test_date_valid?

  def test_date_valid?
    test_date != nil
  end

  def test_date_cannot_be_in_the_future
    errors.add(:test_date, "can't be in the future") if test_date > Date.today
  end
end
