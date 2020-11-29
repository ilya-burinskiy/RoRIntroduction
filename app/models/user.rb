class User < ApplicationRecord
  def started_tests_by_level(level)
    Test.joins(
      'JOIN tests_started_by_users ON tests_started_by_users.test_id = tests.id'
    ).where(
      'level = :level AND tests_started_by_users.user_id = :user_id',
      level: level, user_id: self.id
    )
  end
end
