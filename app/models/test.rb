class Test < ApplicationRecord
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :training_category

  with_options presence: true do
    validates :test_date
    validates :test_category_id, numericality: { other_than: 1 }
    validates :result
    validates :examiner_id
  end
end
