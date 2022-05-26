FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    email { Faker::Internet.free_email }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    employee_number { Faker::Number.decimal_part(digits: 10) }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
