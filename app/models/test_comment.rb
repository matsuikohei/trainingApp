class TestComment < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :content, presence:true
end
