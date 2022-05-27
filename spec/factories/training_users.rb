FactoryBot.define do
  factory :training_user do
    association :user
    association :training
  end
end
