class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rule, uniqueness: true, presence: true

  RULES = [
    'Passed all tests from the C++ category',
    'Passed all tests from the Ruby category',
    'Passed the test on the first try',
    'Passed all first level tests'
  ].freeze
end
