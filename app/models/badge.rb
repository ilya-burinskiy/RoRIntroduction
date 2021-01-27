class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rule, presence: true
  validates :name, uniqueness: true, presence: true
  validates :url, presence: true
  validates :rule_property, presence: true

  RULES = {
    passing_test_on_first_try: 'Passing test on first try',
    passing_all_tests_from_category: 'Passing all tests from category',
    passing_all_tests_by_level: 'Passing all tests by level'
  }
end
