FactoryBot.define do
  factory :test_passage do
    association :user
    association :test
    association :current_question, factory: :question
  end
end
