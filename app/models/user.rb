class User < ApplicationRecord
  has_many :tests_started_by_users, dependent: :destroy
  has_many :started_tests, through: :tests_started_by_users, source: :test, dependent: :destroy
  has_many :created_tests, class_name: "Test", dependent: :destroy

  def started_tests_by_level(level)
    Test.joins(
      'JOIN tests_started_by_users ON tests_started_by_users.test_id = tests.id'
    ).where(
      'level = :level AND tests_started_by_users.user_id = :user_id',
      level: level, user_id: id
    )
  end
end
