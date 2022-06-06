class TestCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'category_test1' },
    { id: 3, name: 'category_test2' },
    { id: 4, name: 'category_test3' }
  ]

  include ActiveHash::Associations
  has_many :tests
end
