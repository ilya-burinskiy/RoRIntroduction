class User < ApplicationRecord
  has_many :tests_started_by_users
  has_many :tests, through: :tests_started_by_users

  def started_tests_by_level(level)
    Test.joins(
      'JOIN tests_started_by_users ON tests_started_by_users.test_id = tests.id'
    ).where(
      'level = :level AND tests_started_by_users.user_id = :user_id',
      level: level, user_id: id
    )
  end
end
