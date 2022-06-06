class Test < ApplicationRecord

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :training_category
end
