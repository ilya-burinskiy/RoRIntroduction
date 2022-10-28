FactoryBot.define do
  factory :user do
    email
    first_name { 'First' }
    last_name { 'Last' }
    password { 'qwerty' }
  end
end
