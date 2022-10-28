FactoryBot.define do
  factory :question do
    sequence(:body) { |n| "Question #{n}" }
    association :test
  end
end
