FactoryBot.define do
  factory :test do
    test_date { Faker::Date.backward(days: 14) }
    test_category_id { Faker::Number.within(range: 2..3) }
    result { Faker::Number.within(range: 1..100) }
    examiner_id { Faker::Number.within(range: 2..10) }
    comment { Faker::Lorem.sentences(number: 1) }
  end
end
