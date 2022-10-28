FactoryBot.define do
  sequence :email do |n|
    "test#{n}@email.com"
  end
end
