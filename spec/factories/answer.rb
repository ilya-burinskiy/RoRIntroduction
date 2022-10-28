FactoryBot.define do
  factory :answer do
    association :question
    correct { false }
    sequence(:body) { |n| "Answer #{n}" }
  end
end
