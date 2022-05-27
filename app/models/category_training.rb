class CategoryTraining < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: 'category_training1'},
    {id: 3, name: 'category_training2'},
    {id: 4, name: 'category_training3'},
  ]
  
  include ActiveHash::Associations
  has_many :trainings
end