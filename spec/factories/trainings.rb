FactoryBot.define do
  factory :training do
    training_date { Faker::Date.backward(days: 14) }
    training_category_id { Faker::Number.within(range: 2..3) }
    content { Faker::Lorem.sentences(number: 1) }
    trainer_id { Faker::Number.within(range: 2..10) }
  end
end
