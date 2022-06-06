class TrainingComment < ApplicationRecord
  belongs_to :user
  belongs_to :training

  validates :content, presence: true
end
