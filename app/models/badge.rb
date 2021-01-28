class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rule, presence: true
  validates :name, uniqueness: true, presence: true
  validates :url, presence: true
  validates :rule_property, presence: true

  enum rule: {
    passing_test_on_first_try:       0,
    passing_all_tests_from_category: 1,
    passing_all_tests_by_level:      2
  }.freeze
end
