FactoryBot.define do
  factory :test do
    title { 'Title' }
    association :category
    association :author, factory: :user
  end
end
