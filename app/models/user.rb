class User < ApplicationRecord
  has_many :tests_started_by_users, dependent: :destroy
  has_many :started_tests, through: :tests_started_by_users, source: :test
  has_many :created_tests, class_name: "Test", dependent: :destroy

  def started_tests_by_level(level)
    started_tests.by_level(level)
  end
end
